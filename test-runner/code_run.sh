#!/bin/sh
export M2_HOME=/opt/apache-maven-3.8.7
export MAVEN_HOME=/opt/apache-maven-3.8.7
export PATH=${M2_HOME}/bin:${PATH}
echo export PATH="${PATH}">> ~/.bashrc
source ~/.bashrc
cd -

echo '=================Start Clone Case Code========================='
git clone $CODE -b $BRANCH code
echo '=================Finish Clone Case Code========================='

echo '=================Start Execute Test Case========================'
cd code
cd $CODE_PATH
$CMD
echo '=================FINISH Execute Test Case========================'

cd ~
mkdir -p logs
mkdir -p onetest/jacoco_coverage/exec_data
ls

cd onetest/jacoco_coverage/

echo '=================Start Clone Source Code========================='
git clone $SOURCE_CODE -b $SOURCE_BRANCH code
echo '=================Finish Clone Source Code========================='

cd code

echo '=================Start Compile Source Code========================='
mvn clean install -Dmaven.test.skip=true -Dmaven.test.failure.ignore=true
echo '=================Finish Compile Source Code========================='

cd ~

echo '=================Start Collector Coverage========================='
nohup java -Xmx512m -DALL_IP=$ALL_IP -DPORT="2023" -DCommitId=$CommitId -Dlogging.path="root/logs" -cp "/root/onetest.collector/lib/*" shell.OneTestShell "$@" > /root/logs/monitor.out 2>&1  &
echo '=================Finish Collector Coverage========================='

res=$?
# wait for result collect
touch /root/testdone
sleep 60
exit $res
