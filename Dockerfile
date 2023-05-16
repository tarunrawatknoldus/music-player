FROM Ubuntu:alpine as Builder
RUN apt-get update -y
RUN apt-get install git -y
RUN git clone https://github.com/tarunrawatknoldus/music-player.git


FROM python:3.9-buster
RUN pip install pillow && pip install django
COPY --from Builder . ./
WORKDIR ./music-player/
CMD ["python3", "manage.py", "runserver", "--noreload"]
