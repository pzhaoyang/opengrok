#!/bin/sh

[ $# != 1 ] && echo "The Project Name is not input! " && exit 1

ProjectName=$1

OpenGrok="/local/software/opengrok/bin/OpenGrok"
TOMCAT_BASE="/local/software/apache"
CODE_BASE="/local/codebase"
INDEX_BASE="/local/opengrok_dataroot"


#set JAVA_HOME
#############
export JAVA_HOME=/local/software/jdk
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH


#set OPENGROK_INFO
##################
export OPENGROK_INSTANCE_BASE="$INDEX_BASE/$ProjectName"
export OPENGROK_WEBAPP_CONTEXT="$ProjectName"


GetNewPort()
{
    defaultPort="2424"
    portFile=./.portNo
    if [ -s $portFile ]; then
        tmpport=`cat $portFile`
        tmpport=$(($tmpport+1)) && echo $tmpport | tee $portFile
    else
        rm -rf $portFile
        echo -n $defaultPort | tee $portFile
    fi
}
##########################
#    deploy              #
##########################

if [ ! -d $OPENGROK_WAR_TARGET_TOMCAT/$ProjectName ]; then
    ProjectPort=${ProjectPort:-`GetNewPort`}
    export OPENGROK_WEBAPP_CFGADDR=localhost:$ProjectPort
    export OPENGROK_TOMCAT_BASE=$TOMCAT_BASE
    echo pzhaoyang: $OPENGROK_WEBAPP_CFGADDR
    $OpenGrok deploy
fi

ProjectPath="$CODE_BASE/$ProjectName"
$OpenGrok index $ProjectPath



