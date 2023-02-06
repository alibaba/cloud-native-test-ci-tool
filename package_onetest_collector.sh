#!/usr/bin/env bash
rm -rf ./onetest.collector.tar.gz ./onetest.collector APP-META/docker-config/onetest.collector.tar.gz APP-META/docker-config/onetest.collector.zip
mvn  clean install -DskipTests

cd onetest-collector
mvn clean assembly:assembly -DskipTests
cd -

pwd
ls
cp APP-META/docker-config/onetest.collector.tar.gz ./
tar -zxf onetest.collector.tar.gz
rm -rf APP-META/docker-config/onetest.collector.tar.gz
rm -rf onetest.collector.tar.gz

tar -czf onetest.collector.tar.gz onetest.collector
mv onetest.collector.tar.gz APP-META/docker-config/

