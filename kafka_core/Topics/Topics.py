from confluent_kafka.admin import AdminClient, NewTopic
import time

# Bootstrap servers — list all brokers from your local cluster
bootstrap_servers = "localhost:9092,localhost:9094,localhost:9096"

# Initialize AdminClient
admin = AdminClient({
    "bootstrap.servers": bootstrap_servers
})

# Define a new topic
topic_name = "example-topic"
new_topic = NewTopic(
    topic=topic_name,
    num_partitions=3,         # how many partitions
    replication_factor=3      # one replica on each broker
)


# Deleting the topic if it exists already
print("deleting the topic if it exists already...")
admin.delete_topics([topic_name])

# Create the topic
print(f"🌀 Creating topic: {topic_name}")
fs = admin.create_topics([new_topic])

# Wait for the result and report success/failure
for topic, f in fs.items():
    try:
        f.result()  # The result itself is None
        print(f"✅ Topic '{topic}' created successfully!")
    except Exception as e:
        print(f"❌ Failed to create topic '{topic}': {e}")

# topic creation isn't instantaneous, so waiting for a bit here...        
time.sleep(.2)
        
# List all topics in the cluster
metadata = admin.list_topics(timeout=10)

print("📜 Topics in cluster:")
for topic in metadata.topics.keys():
    print(f" - {topic}")
