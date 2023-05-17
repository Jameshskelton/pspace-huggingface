FROM python:3.8.16-slim-buster
RUN mkdir app
COPY ./* ./app/
WORKDIR app
RUN pip install -r requirements.txt
EXPOSE 7860