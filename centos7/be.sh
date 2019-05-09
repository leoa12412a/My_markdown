/usr/bin/mysqldump -u root -p3edc1qaz2wsx be > /mysqldump/be.sql
date=`date +%y%m%d`
tar zcf /mysqldump/be-${date}.tar.gz /mysqldump/be.sql
scp /mysqldump/be-${date}.tar.gz root@124.219.58.123:/backup