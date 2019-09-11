#Program:
#	user enter website's URL & DocumentName , Program create new file and insert the vhost config
#History:
#	2019/09/11  -  first time commit 


COLOR_REST='\e[0m';
COLOR_RED='\e[1;31m';

read -p "please enter your webiste $(echo -e $COLOR_RED"URL"$COLOR_REST) " url

read -p "please enter your website $(echo -e $COLOR_RED"DocumentName"$COLOR_REST) " document

touch /etc/httpd/conf.d/$document.conf;

echo "enter your config file ...";

echo -e '<VirtualHost *:80>
    ServerName '$url'
    DocumentRoot  /var/www/html/'$document'
    ErrorLog logs/'$document'
    CustomLog logs/'$document'_log common

    <Directory "/var/www/html/'$document'">
        Options FollowSymLinks
        AllowOverride None
        Order allow,deny
        allow from all
    </Directory>
</VirtualHost>' > /etc/httpd/conf.d/$document.conf;

echo "vhost auto deploy is successful";

