FROM python:3

WORKDIR /data

RUN pip install setuptools

RUN apt-get update && apt-get install -y python3-distutils

RUN pip install legacy-cgi

RUN pip install django==3.2 

COPY . .

RUN python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]


