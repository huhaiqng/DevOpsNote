#### 常用命令

##### Docker

创建 docker

```
docker run -id <REPOSITORY:TAG>   
```

创建有端口映射的 docker

```
docker run -id -p 9090:9090 REPOSITORY:TAG   
```

登陆 docker

```
docker exec -it <CONTAINER ID> /bin/bash
```

查看所有已经创建的 docker

```
docker ps -a
```

查看正在运行的 docker

```
docker ps
```

删除 docker

```
docker rm <CONTAINER ID>
```

启动 docker

```
docker start <CONTAINER ID>
```

停止 docker

```
docker stop <CONTAINER ID>
```

##### 镜像

下载镜像

```
docker pull <REPOSITORY:TAG>
```

删除镜像

```
docker rmi <REPOSITORY:TAG>
```

生成镜像

```
docker build -t <REPOSITORY:TAG> .
```



#### 生成 Docker 镜像

##### 生成 jdk 1.8 镜像

创建 Dockerfile 文件

```
FROM centos:7.6.1810

ADD jdk-8u151-linux-x64.tar.gz /usr/local/

ENV JAVA_HOME /usr/local/jdk1.8.0_151
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN sh -c echo 'Asia/Shanghai' >/etc/timezone
```

生成镜像

```
docker build -t oraclejdk:1.8 .
```

创建 docker

```
docker run -id oraclejdk:1.8
```

登陆 docker 测试 java 版本和时区

```
[root@gpsdb01 centos]# docker exec -it 8d76c676b4e9 /bin/bash
[root@8d76c676b4e9 /]# java -version
java version "1.8.0_151"
Java(TM) SE Runtime Environment (build 1.8.0_151-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.151-b12, mixed mode)
[root@8d76c676b4e9 /]# date
Wed Sep  4 18:25:53 CST 2019
```



##### 生成运行 jar 包的镜像
