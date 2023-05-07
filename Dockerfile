FROM ubuntu:latest 
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install sqlite3 libsqlite3-dev -y
RUN pip install pillow 
RUN pip install django

RUN git clone https://github.com/tarunrawatknoldus/music-player.git 
WORKDIR ./music-player
EXPOSE 8000

CMD ["python3", "manage.py", "makemigrations"]
CMD ["python3", "manage.py", "migrate"]
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]
