from .common import *
from .partials.util import get_secret


# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/
DEBUG = False
ALLOWED_HOSTS = ['enterprise.herokuapp.com', '127.0.0.1']
SECRET_KEY = get_secret('DJANGO_SECRET_KEY')

if get_secret('DATABASE_URL'):
    import dj_database_url
    DATABASES = {
        'default': dj_database_url.config()
    }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
