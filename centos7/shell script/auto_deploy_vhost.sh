#Program:
#	user enter website's URL & DocumentName , Program create new file and insert the vhost config
#History:
#	2019/09/11  -  first time commit 


COLOR_REST='\e[0m';
COLOR_RED='\e[1;31m';

function menu {

	echo -e "What do you want?";
	echo -e "0."$COLOR_RED"cancel"$COLOR_REST;
	echo -e "1.Deploy the "$COLOR_RED"new"$COLOR_REST" website vhost";
	echo -e "2."$COLOR_RED"Delete"$COLOR_REST" the website vhost"
	
    read -p "Enter your choice: " option
}

function new_website()
{
	read -p "please enter your webiste $(echo -e $COLOR_RED"URL"$COLOR_REST) :" url

	read -p "please enter your website $(echo -e $COLOR_RED"DocumentName"$COLOR_REST) :" document

	touch /etc/httpd/conf.d/$document.conf;

	echo "enter your config file ...";

	echo -e '<VirtualHost *:80>
		ServerName '$url'
		DocumentRoot  /var/www/html/'$document'
		ErrorLog logs/'$document'
		CustomLog logs/'$document'_log common

		<Directory "/var/www/html/'$document'">
			Options FollowSymLinks
			AllowOverride All
			Order allow,deny
			allow from all
		</Directory>
	</VirtualHost>' > /etc/httpd/conf.d/$document.conf;

	echo "vhost auto deploy is success";
}

function show_all_config()
{
	cd /etc/httpd/conf.d/
	
	key=1
	
	allfile=""
	
	for i in $(ls)
	do
		echo $key")"$i
		allfile[$key]=$i
		let key=key+1
		
	done
	
	read -p "which do you want to $(echo -e $COLOR_RED"delete"$COLOR_REST) :" delete_file
	
	rm -f "${allfile[$delete_file]}"
	
	echo "Delete is success";
}

menu

case $option in
0)
    echo -e "\n\n Exit. " ;;
1)
    new_website;;
2)
    show_all_config;;
*)
    echo -e "\n\n\nsorry wrong selection" ;;
esac


