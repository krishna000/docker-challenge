FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    procps

RUN pip3 install flask psutil

COPY metrics_server.py /usr/src/app/metrics_server.py

WORKDIR /usr/src/app

EXPOSE 5000

CMD ["python3", "metrics_server.py"]

