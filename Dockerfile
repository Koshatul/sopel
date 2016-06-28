FROM python:3.4-wheezy

WORKDIR /usr/src/app

## Add sopel user
RUN useradd -ms /bin/bash sopel
RUN chown sopel -R /usr/src/app

## Install python requirements
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

## Copy source to docker image
COPY . /usr/src/app

## Switch to sopel user
USER sopel

## Run sopel
ENTRYPOINT ["python3", "-u", "./sopel.py", "--config", "/usr/src/app/sopel.cfg"]
