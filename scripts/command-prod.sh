#!/bin/sh

python manage.py migrate
python manage.py loaddata initial languages templates
python manage.py collectstatic --noinput
