#!/bin/bash

if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (cd martor_demo; python manage.py createsuperuser --no-input)
fi

cd music-player/music_project; gunicorn wsgi.py --user www-data --bind 0.0.0.0:8010 --workers 3

python3 manage.py runserver 0:8000
python3 manage.py runserver
