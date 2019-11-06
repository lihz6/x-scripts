if [[ $EUID -ne 0 ]]; then
  echo Expect run as '`root`' user.
  exit 1
fi

yum -y update
yum -y groupinstall 'Development Tools'
yum install -y yum-utils
yum-builddep -y python


downpile() {
  oldpwd=$PWD
  cd /tmp
  echo Downloading: $1
  while ! curl -O $1; do
    echo Retry: $1
  done
  tar xf $(basename $1)
  cd $(tar tf $(basename $1) | head -1)
  ./configure && make && make install
  cd $oldpwd
}


downpile https://www.sqlite.org/2019/sqlite-autoconf-3280000.tar.gz

# mv /usr/lib64/libsqlite3.so.0.8.6 /usr/local/lib/libsqlite3.so.0.8.6.bak
# cp /usr/local/lib/libsqlite3.so.0.8.6 /usr/lib64
# ldconfig

downpile https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz


python3 --version; pip3 --version

python3 -c 'import sqlite3; print(sqlite3.sqlite_version)'

arr=($(whereis libsqlite3))
ded=:

for a in ${arr[@]:1}; do
  d=$(dirname $a)
  if [[ $ded != *:$d:* ]]; then
    echo $d:
    ls -l $d | grep libsqlite3
    printf '\n\n'
    ded=$ded$d:
  fi
done
