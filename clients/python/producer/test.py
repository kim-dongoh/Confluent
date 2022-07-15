from confluent_kafka import Producer

p = Producer({
    'bootstrap.servers': '{kafka_ip}:<kafka_port>',
    'security.protocol': "sasl_plaintext",
    'sasl.username': "<username>",
    'sasl.password': "<password>",
    'sasl.mechanisms': "PLAIN",
    'plugin.library.paths': 'monitoring-interceptor'
})

def delivery_report(err, msg):
    if err is not None:
        print('Message delivery failed: {}'.format(err))
#    else:
#        print('Message delivered to {} [{}]'.format(msg.topic(), msg.partition()))

for i in range(10000):
    data = {'str': 'result'+str(i)}
    p.poll(0)
    p.produce('<topic_name>', "<message>", callback=delivery_report)

p.flush
