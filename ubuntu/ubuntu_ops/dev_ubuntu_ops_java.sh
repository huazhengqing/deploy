# Java
sudo apt-get install -y default-jre default-jdk
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

tee -a $HOME/.bashrc <<-'EOF'
JAVA_HOME=/usr/java/jdk1.8.0_101
JRE_HOME=$JAVA_HOME/jre
JAVA_BIN=$JAVA_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
EOF
export JAVA_HOME JRE_HOME PATH CLASSPATH

JAVA_HOME=/usr/lib/jvm/java-8-oracle

java -version
