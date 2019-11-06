cd /tmp
cookie="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"
jdkurl=https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz
wget --no-cookies --no-check-certificate --header $cookie $jdkurl
tar xf jdk-8u201-linux-x64.tar.gz
mkdir -p /data/PRG
mv jdk1.8.0_201/ /data/PRG
cd /data/PRG/jdk1.8.0_201
echo "export JAVA_HOME=$(pwd)" >> /etc/profile
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile
. /etc/profile
javac -help

echo "JDK installed!"
