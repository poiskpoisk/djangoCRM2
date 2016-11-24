import os
import pytz
from simpleCRM.secret import login, pwd, sec_key

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = sec_key

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# Белый список хостов куда можно переходить без проверки токена CSFR
ALLOWED_HOSTS=['.example.com','127.0.0.1', 'localhost', 'example.com']

INTERNAL_IPS = ('127.0.0.1',)

SHARED_APPS = (
    'tenant_schemas',  # mandatory
    'globalcustomer',  # you must list the app where your tenant model resides in

    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'django.contrib.sites', # must have for public correct work
    'djangobower',
    'django_nvd3',
)

TENANT_APPS = (
    # The following Django contrib apps must be in TENANT_APPS
    'django.contrib.contenttypes',
    'django.contrib.auth',


    'django.contrib.admin',
    'django.contrib.sites',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'registration',  # добавляем пакет для регистрации пользователей
    'crispy_forms',
    'debug_toolbar',
    'crm',
    'django_tables2',
    'bootstrapform',
    'floppyforms',
    'datetimewidget',
    'django_select2',
    'django_extensions',
    'djangobower',
)

TENANT_MODEL = "globalcustomer.Client"  # app.Model

INSTALLED_APPS = list(set(TENANT_APPS + SHARED_APPS))

MIDDLEWARE_CLASSES = [
    'tenant_schemas.middleware.TenantMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'simpleCRM.urls_tenants'
PUBLIC_SCHEMA_URLCONF = 'simpleCRM.urls_public'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.i18n',
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

DATABASE_ROUTERS = (
    'tenant_schemas.routers.TenantSyncRouter',
)

WSGI_APPLICATION = 'simpleCRM.wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        #'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'ENGINE': 'tenant_schemas.postgresql_backend',
        'NAME': 'scrm',
        'USER': 'ama',
        'PASSWORD': 'alex1972',
        'HOST': '', # Set to empty string for localhost.
        'PORT': '', # Set to empty string for default.
    }
}

# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

# язык сайта по умолчанию, если не удалось определить язык другими способами
LANGUAGE_CODE = 'en'
TIME_ZONE = 'Europe/Moscow'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# указываем, где лежат файлы перевода
LOCALE_PATHS = (
    os.path.join(BASE_DIR, 'locale'),
)

# список доступных языков
LANGUAGES = (
    ('ru', 'Russian'),
    ('en', 'English'),
)

# --------------------   Static files (CSS, JavaScript, Images)   --------------------------------------------
# https://docs.djangoproject.com/en/1.10/howto/static-files/

# STATICFILES_DIRS is the list of folder where Django will search for additional static files,
# in addition to each static folder of each app installed.
STATICFILES_DIRS = [ os.path.join(BASE_DIR, 'project_static'), ]
# URL for APP related static assets
STATIC_URL = '/static/'
# URL for all static files that collected manage.py collectstatic, must be ABS path
STATIC_ROOT = os.path.join(BASE_DIR, 'assets_static')
# List of finder classes that know how to find static files in various locations.
STATICFILES_FINDERS = (
    'djangobower.finders.BowerFinder',
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
     #'django.contrib.staticfiles.finders.DefaultStorageFinder',

)

# -------------------- end of static settings -------------------------------------------------------------

# Абсолютный путь к загружаемым пользователем файлам
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
# Сылка относительно корня, как будут показаны загружаемые пользователем файлы
MEDIA_URL = '/media/'

# Настройки для django-registration-redux
REGISTRATION_OPEN = True  # Если равно True, то пользователи могут регистрироваться
ACCOUNT_ACTIVATION_DAYS = 7  # время в днях течении которого можно активировать аккаунт;
REGISTRATION_AUTO_LOGIN = True  # Если равно  True, то пользователь будет автоматически входить в систему.
LOGIN_REDIRECT_URL = '/'  # Страница, на которую будут попадать пользователи, после успешного входа в систему.

LOGIN_URL = 'login'  # Страница, на которую перенаправляются пользователи, если они не вошли в систему и
# пытаются получить доступ к страницам, которые требуют аутентификации
LOGOUT_URL = 'logout'

# http://djbook.ru/forum/topic/220/
SITE_ID = 1

# localhost с запуском тестового SMTP сервера
# EMAIL_HOST = 'localhost'
# EMAIL_PORT = 1025

# gmail.com
# EMAIL_HOST          = 'smtp.gmail.com'
# EMAIL_PORT          = 587
# EMAIL_HOST_USER     = ""
# EMAIL_HOST_PASSWORD = ""
# EMAIL_USE_TLS       = True

# yandex.ru
EMAIL_HOST = 'smtp.yandex.ru'
EMAIL_PORT = 465
EMAIL_HOST_USER = login
EMAIL_HOST_PASSWORD = pwd
EMAIL_USE_SSL = True

# Добавьте ещё две следующие строчки для отправки писем (трейсбека) админам при возникновении ошибок на сайте:
# Яндекс и mail без указания SERVER_EMAIL такого же как адрес пользователя при подключении к SMPT серверу,
#  т.е. EMAIL_HOST_USER, не будет посылать письма об ошибках.

SERVER_EMAIL = EMAIL_HOST_USER
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER

CRISPY_TEMPLATE_PACK = 'bootstrap3'

DATETIME_FORMAT = 'Y N, j, P'

BOWER_COMPONENTS_ROOT = os.path.join(BASE_DIR, 'components')

BOWER_PATH = '/usr/local/bin/bower'

BOWER_INSTALLED_APPS = (
    'd3#3.3.13',
    'nvd3#1.7.1',
)

