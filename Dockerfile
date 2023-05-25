FROM python:3.8.16-slim-buster
# COPY ./* ./$name/
ARG HF_REPO
ARG HF_NAME
RUN mkdir app
RUN echo $HF_NAME $HF_REPO
WORKDIR app
RUN apt-get update && apt-get install git-all -y
RUN apt-get install git-lfs
RUN git-lfs clone $HF_REPO
RUN cp $HF_NAME/* ./
RUN pip install -r $HF_NAME/requirements.txt
RUN pip install -U gradio

EXPOSE 7860