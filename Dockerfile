FROM python:alpine3.18
RUN apt-get update -y
RUN apt-get install git -y
RUN pip install pillow
RUN pip install django

RUN git clone https://github.com/tarunrawatknoldus/music-player.git
WORKDIR ./music-player/
CMD ["python3", "manage.py", "runserver", "--noreload"]
