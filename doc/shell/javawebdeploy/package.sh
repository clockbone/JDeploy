#!/bin/bash

# SVN检出并Maven打包
#
# 参数：
# $1 UUID
# $2 SVN地址
# $3 Jetty的start.jar路径
# $4 项目部署路径
# $5 版本控制系统(1.SVN;2.GIT)

rm -rf $4/$1
mkdir -p $4/$1
cd $4/$1

if [ $5 -eq 1 ]
then
	svn checkout $2 .
else
	git clone $2 .
fi

mvn clean package -Dmaven.test.skip=true

java -jar $3 --add-to-startd=http,deploy,jsp