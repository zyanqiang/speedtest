go开发的speedtest ,自带web，参考https://github.com/adolfintel/speedtest

优点不需要php+nginx环境，只要执行bin文件就提供speedtest在线服务

演示  http://123.206.23.218:8899



修改 conf\config-base.json 绑定ip和监听端口号
```
{
	"Port": 8899,
	"Addr": "0.0.0.0"
}
```
编译     ./control build

启动服务 ./control start

关闭服务 ./control stop
