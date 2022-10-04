# keypair 생성

keypair 디렉토리 생성

```
mkdir ./keypair
```
```
cd ./keypair
```

keypair 생성

```
openssl genrsa -out ./keypair.pem 2048
```
```
openssl rsa -in ./keypair.pem -outform PEM -pubout -out ./public.pem
```

# MDS Login
## confluent command Install
> https://docs.confluent.io/confluent-cli/current/install.html#cli-install
```
curl -sL --http1.1 https://cnfl.io/cli | sh -s -- latest
```
## Login
```
confluent login --url <MDS IP>:<MDS PORT>
```
```
confluent login --url kafka1:8090
```
