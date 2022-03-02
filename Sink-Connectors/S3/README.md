### S3 Sink Connector


* flush.size: s3에 만들어지는 json 파일 당 적재되는 메시지의 수
예를들어 `"flush.size": "1000"`으로 할 시, Topic에 쌓이는 데이터 1000개당 s3에 json 파일이 1개 만들어 지며 그 json 파일 안에 데이터 1000개가 기록되어 있다.


* rotate.schedule.interval.ms: s3에 json 파일이 만들어지는 주기를 설정
예를들어 `"rotate.schedule.interval.ms": "60000"`할 시, Topic에 데이터가 `fulsh.size`로 지정한 만큼 쌓이지 않았더라도 시스템 시간 상 60초마다 그동안 쌓인 데이터들만 가지고 json 파일을 만들어 s3에 저장


* partitioner.class: s3에 데이터를 저장할 때 디렉토리 경로를 설정(버킷 내에서 새로운 디렉토리를 만들어서 파티셔닝 함)하는 방식 지정
`io.confluent.connect.storage.partitioner.DefaultPartitioner`
`io.confluent.connect.storage.partitioner.FieldPartitioner`
`io.confluent.connect.storage.partitioner.TimeBasedPartitioner`
중에서 선택
`io.confluent.connect.storage.partitioner.DefaultPartitioner`: Topic의 partition 별로 디렉토리를 나눠서 파일들 저장
`io.confluent.connect.storage.partitioner.TimeBasedPartitioner`: `partition.duration.ms`로 지정한 시간 이후에 `path.format`으로 지정한 형식에 맞게 디렉토리가 생성

* path.format: bucket명/topics/topic명/ 다음 데이터를 담은 파일이 저장될 경로를 지정

`'Year'=YYYY/'월'=MM/'Day'=dd/'시간'=HH/'Minute'=mm` 으로 할 시 아래와 같은 경로 생김
```
Bucket명
	ㄴ topics
		ㄴ Topic명
			ㄴ Year=2021
				ㄴ 월=11
					ㄴ Day=17
						ㄴ 시간=14
							ㄴ Minute=53
```

`'Year'=YYYY-'월'=MM-'Day'=dd-'시간'=HH-'Minute'=mm`으로 할 시 아래와 같은 경로 생김 (/ 대신 - 로 교체 시)
```
Bucket명
	ㄴ topics
		ㄴ Topic명
			ㄴ Year=2021-월=11-Day=17-시간=14-Minute=53
```


* partition.duration.ms: `path.format`에 정한 경로가 새로 생성되는 시간 간격
`"partition.duration.ms": "1800000"`으로 설정 시 30분 마다 `path.format`의 경로 중 `Minute=mm` 부분이 새로 추가되며 저장되는 파일의 파티션 역할을 하게 됨
`"partition.duration.ms": "3600000"`으로 설정 시 1시간 마다 `path.format`의 경로 중 `Hour=HH` 부분이 새로 추가되며 저장되는 파일의 파티션 역할을 하게 됨
(이 경우 `"path.format"="'Year'=YYYY/'월'=MM/'Day'=dd/'Hour'=HH"` 이렇게 path.format을 Hour까지만 지정해야 한다.)



- - - -
### Optional 설정값
* value.converter: 메시지의 value 변환 클래스
만약 `connect-distributed.properties`의 value.converter와 다른 형식의 데이터를 다뤄야 한다면 connector 설정값으로 지정해서 따로 설정할 수 있다. 
아래 중 선택
```
org.apache.kafka.connect.json.JsonConverter
org.apache.kafka.connect.storage.StringConverter
org.apache.kafka.connect.converters.ByteArrayConverter
io.confluent.connect.avro.AvroConverter
io.confluent.connect.protobuf.ProtobufConverter
```

* value.converter.schema.registry.url: schema registry를 사용할 경우 설정
다음과 같이 설정
```
"value.converter.schema.registry.url": "<Schema Registry의 주소:8081>"
```

* schemaRegistryLocation: 위의 value.converter.schema.registry.url과 같이 써줌 (추가 확인 필요)
```
"schemaRegistryLocation": "<Schema Registry의 주소:8081>"
```
schema 관련 위 3개의 설정을 해주면 schema, payload 로 정의 된 데이터를 지정한 형식으로 변환해서 s3에 저장해 줌


* input.data.format: Topic에 저장된 데이터의 형식
[JSON, JSON_SR, AVRO, BYTES, PROTOBUF] 중에서 선택

JSON_SR: JSON Schema Registry

PROTOBUF: Protocol Buffers


* output.data.format: S3에 저장할 데이터의 형식
[JSON, AVRO, BYTES, PARQUET] 중에서 선택 

PARQUET: 컬럼 기반 저장 포맷


* format.class: output.data.format에 지정한 형식에 맞는 클래스 지정해 줘야 한다.

`io.confluent.connect.s3.format.avro.AvroFormat`
`io.confluent.connect.s3.format.bytearray.ByteArrayFormat`
`io.confluent.connect.s3.format.json.JsonFormat`
`io.confluent.connect.s3.format.parquet.ParquetFormat`

중에서 선택
