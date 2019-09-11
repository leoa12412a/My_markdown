#!/bin/bash

function ladypan {
    cd /var/www/html/291_ladypan/;
}

function herbhealth {
    cd /var/www/html/267_herbhealth/;
}
 
function lerich {
    cd /var/www/html/329_lerich/;
}

function menu {

    echo -e "Deploy Menu \n"
    echo -e "1). Deploy ladypan "
    echo -e "2). Deploy herbhealth "
    echo -e "3). Deploy lerich"
    # echo -en "\nEnter your choice: "
    # read -n 1 option

    read -p "Enter your choice: " option
}

function deploy {
    git st; git stash; git pull --rebase; git stash pop;
}

    menu
    case $option in
    0)
        echo -e "\n\n Exit. " ;;
    1)
        ladypan; deploy;;
    2)
        herbhealth; deploy;;
    3)
        lerich; deploy;;
    *)
        echo -e "\n\n\nsorry wrong selection" ;;
    esac

    echo -e "\n\n"
    pwd;

    echo -e "\n\nDeploy Done.....!\n"


#google vt100 ansi 顏色  (調整字體顏色)