#Docker 是什麼?
>把你的應用程式連同環境一起打包，部屬的時候就不用再擔心環境的問題
#圖例
>Docker 將三個已經打包起來的程式跑在不同的 container（容器）中
>每個 container 都是一個獨立的環境，可以跑不同的系統跟安裝不同的資料庫、編譯器等等
>意思就是說你可以 A 專案用 php5.3，另外一個用 php7，完全不會衝突

![](https://cdn-images-1.medium.com/max/800/1*aMYtlKDuMsYxO-U7AM0A_g.png)

###範例
安裝docker 
https://hub.docker.com/search/?offering=community&q=&type=edition
支援 Linux、Mac 跟 Windows
###顯示版本 
>docker version

###從 Docker Hub 上 pull image
 Docker Hub 上有很多官方的 image 可以直接拿來用
>docker pull ubuntu

###查看image
>docker image ls

###試著將ubuntu 的 image 跑起來變成 container
>docker run -it ubuntu bash

###檢查版本
>cat /etc/*release

到目前為止，我們已經可以在任何系統上用 Docker 跑 ubuntu 的環境了

***
###事前準備
首先啟動一個伺服器
https://github.com/Larry850806/simple-express-server
###啟動流程
>cd 資料夾
>npm install
>node index.js

http://127.0.0.1:8080/
***
###開始 dockerize 你的應用程式
目標是把你的程式碼跟想要的環境打包起來，變成一個 image

###新增Dockerfile
為了把環境跟程式碼包成一個 image，我們需要一個 Dockerfile 把打包的步驟寫在裡面
>docker-test
├── Dockerfile   <--   這裡
├── README.md
├── index.js
├── node_modules
└── package.json

###Dockerfile內容
>FROM node:9.2.0 //環境
COPY index.js package.json /app/  //複製code到app資料夾
WORKDIR /app //切換目錄
RUN npm install && npm cache clean --force 
CMD node index.js

把流程放入Dockerfile

###build
進到資料夾下
>cd test01
>docker build -t test01 .
>docker image ls

###run

>docker run test01
>docker run -p 3333:8080 test01 //8080 port 跟外部的 3000 port 接通
>docker run -d test01 //背景執行(會拿到ID)
>docker logs ID //看log

***
#Docker Hub
讓大家可以 pull（下載）或是 push（上傳）image 的地方

###push

給image tag 帳號標籤
>docker tag test01 a121514191/test01
>docker image ls
>docker login
>docker push a121514191/test01

###pull
先刪除
>docker rmi -f test01
>docker rmi -f a121514191/test01