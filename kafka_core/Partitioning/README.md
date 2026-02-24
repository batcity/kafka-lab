# Partitioning:
## TODO: Refine this documentation

Each Topic in Kafka can have one or more partitions, each partition is essentially and independent log based data structure that's stored durably in one of the machines in the kafka cluster. The only thing tying together partitions is that they belong to the same topic

These partitions enable high concurrency and scalability

With regards to scalability, a single machine can only store so much data but if topics are partitioned and the partitions are split across several machines on a cluster then the user can store a vast amount of data

With regards to Concurrency, multiple produces can write data to a single topic concurrently, kafka serializes them and appends them to the distributed log that sits at it's core. 

While multiple consumers in the same Consumer Group can read from the same topic, Kafka restricts each partition to only one consumer at a time within that group. This ensures that records are processed in order and prevents "offset contention."

Key Concept: The Offset

Offsets are stored per Consumer Group + Topic + Partition combination

The offset is a unique identifier for each record within a partition. Kafka tracks the "current position" of a consumer group via these offsets. Because an offset is specific to a partition, the partition serves as the smallest unit of parallelism in a Kafka cluster.

> Note: A single broker/machine in the kafka cluster can store multiple partitions that belong to a single topic, these partitions don't necessarily have to live on different machines