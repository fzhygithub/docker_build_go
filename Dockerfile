#FROM golang
FROM golang:alpine3.11

## 在docker的根目录下创建相应的使用目录
RUN mkdir -p /www/webapp
## 设置工作目录
WORKDIR /www/webapp
## 把当前（宿主机上）目录下的文件都复制到docker上刚创建的目录下
COPY . /www/webapp
## 编译
RUN go build .
## 设置docker要开发的哪个端口
EXPOSE 8080
## 启动docker需要执行的文件
CMD go run main.go

#change main.go
#docker build -t go:latest .
#docker run -d -p 8081:8080 go:latest
#curl http://localhost:8081


#http://www.iamlintao.com/6748.html
