#use "source mysetenv.sh"
echo now set opengrok env vars...
export OPENGROK_APP_SERVER=Tomcat
export OPENGROK_TOMCAT_BASE=/local/software/apache
export OPENGROK_WAR_TARGET_TOMCAT=$OPENGROK_TOMCAT_BASE/webapps
export CATALINA_HOME=$OPENGROK_TOMCAT_BASE
#opengrok home directory
#export OPENGROK_INSTANCE_BASE="/local/opengrok_dataroot"
#source code root
#export SRC_ROOT="/local/codebase"
#generated data root
#export DATA_ROOT="/local/opengrok_dataroot"

#
echo now call setjavaenv.sh...
export JAVA_HOME=/local/software/jdk
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
