### 1. 명령어 실행
```
kafka-reassign-partitions \
--bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 \
--reassignment-json-file replication-factor.json --execute
```

### Tip
`replicas` 필드에 지정한 노드 수 만큼 replication-factor가 변경됨

`replicas` 필드에 지정한 노드 중 가장 앞의 노드가 리더로 선정됨

기존 리더를 파악하여 가장 앞에 배치하는 것을 추천
