FROM ubuntu:latest as Builder
WORKDIR ./music-player/
RUN apt update -y
RUN apt install git -y
RUN git clone https://github.com/tarunrawatknoldus/music-player.git

FROM python:alpine3.18
RUN pip install pillow && pip install django
COPY --from=Builder ./music-player .
WORKDIR ./music-player/
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0:8000", "--noreload"]
