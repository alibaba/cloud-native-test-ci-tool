#!/bin/sh
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

export M2_HOME=/opt/apache-maven-3.8.7
export MAVEN_HOME=/opt/apache-maven-3.8.7
export PATH=${M2_HOME}/bin:${PATH}

git clone $CODE -b $BRANCH code 

cd code
cd $CODE_PATH
$CMD
res=$?
# wait for result collect
touch /root/testdone
sleep 60
exit $res
