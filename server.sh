#!/bin/sh

export JAVA_HOME=/local/software/jdk
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

usage(){
    echo ################  usage  ##################
    echo $0 start      : start tomcate
    echo $0 stop       : stop tomcate
    echo ################  usage  ##################
}

TOMCAT_BASE="apache"
apache_start="$TOMCAT_BASE/bin/startup.sh"
apache_stop="$TOMCAT_BASE/bin/shutdown.sh"

[ $# != 1 ] && echo "Please Input action parameter!" && usage && exit 1

if [ "$1" = "start" ]; then
    $apache_start
elif [ "$1" = "stop" ]; then
    $apache_stop
else
    echo "The parameter is not match requirement."
    exit 1
fi
