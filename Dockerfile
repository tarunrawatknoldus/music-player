FROM python:3.9-buster
RUN apt-get update -y
RUN apt-get install git -y
RUN pip install pillow && pip install django

RUN git clone https://github.com/tarunrawatknoldus/music-player.git
WORKDIR ./music-player/
CMD ["python3", "manage.py", "runserver", "--noreload"]
