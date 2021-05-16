#!/bin/sh

python manage.py migrate
python manage.py loaddata initial languages templates
python manage.py runserver 0.0.0.0:8000
