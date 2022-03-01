### Datagen-Schema Connector

`format.class`와 `output.data.format`을 지정하여 전송받는 데이터의 형식을 지정할 수 있다.

`quickstart`의 종류는 orders, product 등 다양하다.

일반 Datagen Connector에 Schema Registry를 붙여 Schema가 포함된 데이터를 전송받을 수 있다.

`value.converter`: 전송받을 데이터의 형식에 맡게 지정

`value.converter.schema.registry.url`, `schemaRegistryLocation`: Schema Registry의 주소를 입력
