FROM python:3.6.6-slim-jessie

# instalação do oracle instant client
ADD docker/oracle-instantclient/ /opt/data
# extensões básicas das aplicações de python
ADD docker/requirements.txt /opt/data

ENV ORACLE_HOME=/opt/oracle/instantclient
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

ENV OCI_HOME=/opt/oracle/instantclient
ENV OCI_LIB_DIR=/opt/oracle/instantclient
ENV OCI_INCLUDE_DIR=/opt/oracle/instantclient/sdk/include

WORKDIR /opt/data

ADD src/ /app/

RUN apt-get update && \
    apt-get install -y unzip gcc libc-dev && \
    pip install -r ./requirements.txt && \
    ./install-instantclient.sh && \
    bash

WORKDIR /app

CMD ["python", "./main.py"]
