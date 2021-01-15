yum install httpd -y;
systemctl start httpd.service;
systemctl enable httpd.service;
firewall-cmd --add-port=80/tcp --permanent;
firewall-cmd --add-port=443/tcp --permanent;
firewall-cmd --reload;
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y;
yum install yum-utils -y;
yum-config-manager --enable remi-php73;
yum install php php-fpm php-mysqlnd php-mysql php-opcache php-xml php-xmlrpc php-gd php-mbstring php-json -y;
systemctl restart httpd.service;
yum install wget -y;
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm;
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm;
sudo yum install mysql-server;
sudo systemctl start mysqld;
yum update;