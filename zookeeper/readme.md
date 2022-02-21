### 1. myid 파일 수정
`/home/ubuntu/zookeeper/zookeeperDir/myid` 파일의 내용을 3대의 각 서버에 맞게 1, 2, 3으로 변경

### 2. systemd 등록
```
sudo cp /home/ubuntu/zookeeper/confluent-zookeeper.service /lib/systemd/system/
sudo systemctl daemon-reload
```
