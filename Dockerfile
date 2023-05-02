FROM ubuntu:latest As Builder
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip install pillow 
RUN pip install django

RUN git clone https://github.com/tarunrawatknoldus/music-player.git 
WORKDIR ./music-player
EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]



