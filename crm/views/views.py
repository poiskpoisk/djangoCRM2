import time, datetime, math

from django.contrib.auth.decorators import permission_required as perm_req_std
from django.db.models import Q
from django.shortcuts import render
from crm.models import DealStatus
from django.db.models import F
from django.db.models import Sum
from django.contrib import messages
from django.utils.translation import ugettext as _



@perm_req_std('crm.read_customer')
def reportSalesPerson(request, model, modelTable=None, classFilter=None):
    queryset = model.objects.all()
    # Extend a query additional data from related models
    queryset = queryset.annotate(deal_data=F('dealstatus__deal_data'))
    queryset = queryset.annotate(deal_time=F('dealstatus__deal_time'))
    queryset = queryset.annotate(deal_status=F('dealstatus__status'))

    filter = classFilter(request.GET, queryset=queryset)
    queryset = filter.qs

    # compute the date range for the chart
    try:
        queryset=queryset.exclude(deal_data__isnull=True)
        data_min = queryset.earliest("deal_data").deal_data
        data_max = queryset.latest("deal_data").deal_data
        queryset = queryset.filter(deal_data__gte=data_min, deal_data__lte=data_max)
    except:
        messages.error(request, _('Нет релевантных данных для выбранных параметров фильтров'))
        return render(request, 'crm/report_sp.html', {'filter':filter})

    # select only last deals and rejected other
    for query in queryset:
        deals = queryset.filter(ident=query.ident)
        latest_data = deals.latest("deal_data").deal_data
        latest_time = deals.filter(deal_data=latest_data).latest("deal_time").deal_time
        queryset = queryset.exclude( Q(ident=query.ident) and ~Q(deal_time=latest_time), ident=query.ident )

    delta = data_max - data_min
    # round up step
    step = datetime.timedelta(days=math.ceil(delta.days/20))

    # too small date interval forbidden
    if delta < datetime.timedelta(days=20) or data_min > data_max:
        messages.error(request, _('Выбран слишком маленький или не правильный временной интервал ( минимум 20 дней ) '))
        return render(request, 'crm/report_sp.html', {'filter': filter})

    # selected sales_person for display on chart
    sales_person = _("Все") if filter.form.cleaned_data['sales_person'] == None else filter.form.cleaned_data['sales_person']

    # compute the price and qty deals of a selected date range
    xdata = []
    ydata = []
    ydata_qty=[]
    date_begin = data_min
    point = int(time.mktime(date_begin.timetuple())*1000)
    for x in range(20):
        xdata.append(point)
        date_end = date_begin + step
        point = int(time.mktime(date_end.timetuple())*1000)
        # the same record will be rejected
        qs=queryset.filter(deal_data__gte=date_begin, deal_data__lte=date_end)
        tp=qs.exclude(price__isnull=True).aggregate(total_price=Sum('price'))
        ydata_qty.append(qs.count())
        ydata.append(int(0 if tp['total_price'] == None else tp['total_price']))
        date_begin = date_end

    chartdata = {'x': xdata, 'y': ydata, 'name': str(sales_person) }
    charttype = "lineChart"
    chartcontainer = 'linechart_container'

    chartdata_qty = {'x': xdata, 'y': ydata_qty, 'name': str(sales_person)}
    charttype_qty = "lineChart"
    chartcontainer_qty = 'linechart_container_qty'

    data = {
        'filter': filter,
        'charttype': charttype,
        'chartdata': chartdata,
        'chartcontainer': chartcontainer,

        'charttype_qty': charttype_qty,
        'chartdata_qty': chartdata_qty,
        'chartcontainer_qty': chartcontainer_qty,

        'extra': {
            'x_is_date': True,
            'x_axis_format': '%d %b %Y',
            'tag_script_js': True,
            'jquery_on_ready': False,
        }
    }

    return render(request, 'crm/report_sp.html', data)


@perm_req_std('crm.read_customer')
def reportFunnel(request, model, modelTable=None, classFilter=None):
    queryset = model.objects.all()
    # Extend a query additional data from related models
    queryset = queryset.annotate(deal_data=F('dealstatus__deal_data'))
    queryset = queryset.annotate(deal_time=F('dealstatus__deal_time'))
    queryset = queryset.annotate(deal_status=F('dealstatus__status'))

    filter = classFilter(request.GET, queryset=queryset)
    queryset = filter.qs

    records = []
    for status in DealStatus.STATUS_CHOICES:
        record = []
        record.append(status[1])
        record.append(queryset.filter(deal_status=status[0]).count())
        records.append(record)

    recordsMany = []
    for status in DealStatus.STATUS_CHOICES:
        record = []
        record.append(status[1])
        sum_pr = queryset.filter(deal_status=status[0]).aggregate(Sum('price'))
        sum_str = str(sum_pr['price__sum'])
        if sum_str == "None":
            sum_str = '0'
        sum_int = float(sum_str)
        record.append(sum_int)
        recordsMany.append(record)

    return render(request, 'crm/report_funnel.html',
                  {'records': records, 'records_many': recordsMany, 'filter': filter})

def setLang(request):
    # get list of NOT NULL
    return render(request, 'crm/lang.html')
