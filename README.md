# Kafka Lab

This repository contains a collection of Kafka implementations and deep-dives, featuring executable code paired with detailed explanations of advanced concepts

Each concept has its own folder with a Python script and README explaining the idea.

## Table of Contents

### Kafka Core
- [Producers](./kafka_core/Producers/README.md)
- [Consumers](./kafka_core/Consumers/README.md)
- [Topics](./kafka_core/Topics/README.md)
- [Partitioning](./kafka_core/Partitioning/README.md)
- [Broker](./kafka_core/Broker/README.md)

### Kafka Streams
- [Basics](./kafka_streams/Basics/README.md)
- [Joins](./kafka_streams/Joins/README.md)
- [Windowing](./kafka_streams/Windowing/README.md)
- [Stateful Processing](./kafka_streams/Stateful/README.md)

### Kafka Connect
- [Sources](./kafka_connect/Sources/README.md)
- [Sinks](./kafka_connect/Sinks/README.md)
- [Transforms](./kafka_connect/Transforms/README.md)

### Schema Registry
- [Avro](./kafka_schema_registry/Avro/README.md)
- [Protobuf](./kafka_schema_registry/Protobuf/README.md)
- [JSON Schema](./kafka_schema_registry/JSONSchema/README.md)

---

## Setup Instructions

To set up the environment, run:

```bash
. ./setup.sh
````

> ⚠️ Use the `.` (dot) before `./setup.sh` so the script runs in the current shell and activates the virtual environment automatically.

This script will:

1. Create a virtual environment in `.venv` if it doesn't exist.
2. Activate the environment in the current shell.
3. Upgrade `pip`.
4. Install dependencies: `confluent-kafka` and `jupyterlab`.

After setup:

* Your environment is already activated.
* To deactivate, run:

  ```bash
  deactivate
  ```
* Check Python:

  ```bash
  which python
  ```
* Check Pip:

  ```bash
  which pip
  ```

---

## How to Run Scripts

Since the virtual environment contains the Kafka Python client, run scripts using Python:

```bash
python your_file.py
```

---

## How to Use

1. Navigate to a concept folder.
2. Read the `README.md` in that folder to understand the concept.
3. Run the `.py` file using Python.
4. Experiment and modify the code to deepen your understanding.
