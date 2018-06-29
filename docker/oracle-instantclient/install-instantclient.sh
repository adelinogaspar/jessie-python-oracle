#!/usr/bin/env bash
mkdir /opt/oracle
unzip instantclient-basic-linux.x64-12.1.0.2.0.zip -d /opt/oracle
unzip instantclient-sdk-linux.x64-12.1.0.2.0.zip -d /opt/oracle
mv /opt/oracle/instantclient_12_1 /opt/oracle/instantclient
ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so
ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so

cp ld-linux-x86-64.so.2 /opt/oracle/instantclient/
cp libaio.so.1 /opt/oracle/instantclient/
cp libnsl.so.1 /opt/oracle/instantclient/

export ORACLE_HOME="/opt/oracle/instantclient"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

export OCI_HOME="/opt/oracle/instantclient"
export OCI_LIB_DIR="/opt/oracle/instantclient"
export OCI_INCLUDE_DIR="/opt/oracle/instantclient/sdk/include"
