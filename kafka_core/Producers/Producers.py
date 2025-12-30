from confluent_kafka import Producer

# Bootstrap servers — list all brokers from your local cluster
bootstrap_servers = "localhost:9092,localhost:9094,localhost:9096"

def delivery_report_callback(err, msg):
    
    if err is not None:
        print(err)
        return
    
    print("message delivered to:", msg.topic(), "and partition", msg.partition())

producer = Producer({"bootstrap.servers": bootstrap_servers})
producer.produce('example-topic', "hello topic!", callback=delivery_report_callback)

# Wait for any outstanding messages to be delivered and delivery report
# callbacks to be triggered.
producer.flush()