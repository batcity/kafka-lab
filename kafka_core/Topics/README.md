# Kafka Topic:

Topics are fundamental units that hold messages (events) in Kafka, they are similar to folders in a file system

Each topic can have multiple producers and consumers. A topic can also be partitioned, allowing Kafka to scale throughput and enable parallel consumption.

Each event in a Kafka topic has an associated offset, which represents its position within a specific partition. Consumers use offsets to track which messages they have read

Events in a Kafka topic are immutable and are stored durably for a configurable retention period, after which they may be deleted or compacted.