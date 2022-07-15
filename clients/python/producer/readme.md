# confluent_kafka 모듈
```
sudo apt install pip
```
```
sudo pip install confluent-kafka
```

# monitoring-interceptor 사용
### 구성된 Confluent Platform과 맞는 버전의 key, repository 추가
> https://docs.confluent.io/platform/current/installation/installing_cp/deb-ubuntu.html#get-the-software
```
wget -qO - https://packages.confluent.io/deb/7.1/archive.key | sudo apt-key add -
```
```
sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/7.1 stable main"
sudo add-apt-repository "deb https://packages.confluent.io/clients/deb $(lsb_release -cs) main"
```
### confluent-librdkafka-plugins 패키지 설치
```
sudo apt install confluent-librdkafka-plugins
```
```
sudo apt install librdkafka-dev
```
