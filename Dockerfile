FROM python:3.8.16-slim-buster
COPY ./* ./app/
RUN ls
WORKDIR app
RUN apt-get update && apt-get install git-all -y
RUN pip install -r requirements.txt
EXPOSE 7860