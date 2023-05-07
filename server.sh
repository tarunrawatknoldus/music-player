#!/bin/bash
python3 manage.py makemigrations
python3 manage.py migrate
python manage.py syncdb --noinput
python manage.py createsuperuser --username admin --password admin --email admin@exmaple.com
python3 manage.py runserver
