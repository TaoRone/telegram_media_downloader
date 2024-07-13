本文基于[tangyoha](https://github.com/tangyoha/telegram_media_downloader)项目进行修改，主要解决解决tangyoha版本存在的pyrogram包版本过旧问题，同时提供长久解决办法
主要代码基于原作者，感谢原作者提供这么好用的项目
# 简易使用方法
## docker版本：
使用方式参照原项目，仅需将镜像修改为taorperson/telegram_media_downloader:latest
其中sessions和config.yaml需要映射，下载目录参照原版自行修改
举例：
```
docker run -itd   --name telegram-media-downloader 
-v /volume1/Setting/telegram_media_downloader/config.yaml:/app/config.yaml
-v /volume1/Setting/telegram_media_downloader/sessions/:/app/sessions
taorperson/telegram_media_downloader:latest
```

unraid和群晖，需要手动先执行以上代码输入手机完成验证后，再运行正式配置的容器

## windows版本
直接git本代码后，编译运行即可


# 后续更新
## docker
如果我没有及时更新本代码，解决办法：
git本代码,假设你拉取的位置在/root/telegram_media_downloader
通过虚拟环境更新包：
```
python3 -m venv venv
source venv/bin/activate

pip install  --upgrade pip
pip3 install pyrogram --upgrade

cp -r venv/lib/python3.11/site-packages /root/telegram_media_downloader
```
