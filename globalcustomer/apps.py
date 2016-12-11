from django.apps import AppConfig


class GlobalcustomerConfig(AppConfig):
    name = 'globalcustomer'

    def ready(self):
        import globalcustomer.signals