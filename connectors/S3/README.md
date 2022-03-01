### S3 Sink Connector

* flush.size: s3에 만들어지는 json 파일 당 적재되는 메시지의 수

예를들어 `"flush.size": "1000"`으로 할 시, Topic에 쌓이는 데이터 1000개당 s3에 json 파일이 1개 만들어 지며 그 json 파일 안에 데이터 1000개가 기록되어 있다.

*  
