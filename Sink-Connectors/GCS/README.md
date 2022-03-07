### GCS Sink Connector


* flush.size: s3에 만들어지는 json 파일 당 적재되는 메시지의 수
예를들어 `"flush.size": "1000"`으로 할 시, Topic에 쌓이는 데이터 1000개당 s3에 json 파일이 1개 만들어 지며 그 json 파일 안에 데이터 1000개가 기록되어 있다.


* rotate.schedule.interval.ms: s3에 json 파일이 만들어지는 주기를 설정
예를들어 `"rotate.schedule.interval.ms": "60000"`할 시, Topic에 데이터가 `fulsh.size`로 지정한 만큼 쌓이지 않았더라도 시스템 시간 상 60초마다 그동안 쌓인 데이터들만 가지고 json 파일을 만들어 s3에 저장


* 인증

|아래의 2가지 중 1개의 방법을 택하여 인증하면 된다.|
|--------------------------------------|
| gcs.credentials.path (GCS credential file의 경로를 입력하여 인증) |
| gcs.credentials.json (GCS credenteal file의 내용을 입력하여 인증) |


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


