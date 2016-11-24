from django.contrib.auth.decorators import login_required
from django.shortcuts import render, render_to_response
from crm.models import DealStatus, Deal
from django.db.models import F
from django.db.models import Sum, Min, Max
import time, datetime
from django.contrib import messages
from django.utils.translation import ugettext as _



@login_required
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
        queryset = queryset.filter(deal_data__gt=data_min, deal_data__lt=data_max)
    except:
        messages.error(request, _('Выбран слишком маленький временной интервал или нет релевантных данных'))
        return render(request, 'crm/report_sp.html', {'filter':filter})

    delta = data_max - data_min
    step = delta/20

    # selected sales_person for display on chart
    try:
        sales_person = queryset.exclude(sales_person__isnull=True)[0].sales_person
    except:
        messages.error(request, _('Нет данных по контрактам для этого менеджера'))
        return render(request, 'crm/report_sp.html', {'filter':filter})

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
        qs=queryset.filter(deal_data__gt=date_begin, deal_data__lt=date_end)
        ydata_qty.append(qs.count())
        tp=qs.exclude(price__isnull=True).aggregate(total_price=Sum('price'))
        ydata.append(int(0 if tp['total_price'] == None else tp['total_price']))
        date_begin = date_end

    if data_max == data_min or data_min > data_max:
        messages.error(request, _('Выбран слишком маленький временной интервал или нет релевантных данных'))
        return render(request, 'crm/report_sp.html', {'filter': filter})



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


@login_required
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
