FROM python:3.8-slim
LABEL description='Dockerfile1'

RUN apt update -y && apt upgrade -y

COPY requirements.txt ./
RUN python3 -m venv env && \
    env/bin/pip install -r requirements.txt

COPY src/*.py ./
CMD python3 src/utils.py Hi
