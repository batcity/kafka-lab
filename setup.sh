#!/usr/bin/env bash

VENV_DIR=".venv"

# Helper function to handle errors without exiting the shell
run_or_exit() {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "❌ Command failed: $*"
        return $status
    fi
}

# 1️⃣ Setup Python environment
if [ -d "$VENV_DIR" ]; then
    echo "✅ Virtual environment already exists in $VENV_DIR"
    echo "👉 Activating it..."
    source "$VENV_DIR/bin/activate"
else
    echo "🚀 Setting up Kafka Lab environment..."
    echo "📦 Creating virtual environment in $VENV_DIR..."
    python3 -m venv "$VENV_DIR"

    echo "👉 Activating environment..."
    source "$VENV_DIR/bin/activate"

    echo "⬆️  Upgrading pip..."
    run_or_exit pip install --upgrade pip

    echo "📥 Installing dependencies (confluent-kafka + JupyterLab)..."
    run_or_exit pip install confluent-kafka jupyterlab

    echo "🎉 Python setup complete!"
fi

# 2️⃣ Start Kafka cluster via Docker Compose
if ! command -v docker &>/dev/null; then
    echo "❌ Docker is not installed. Please install Docker to run Kafka locally."
    return 1
fi

if ! docker compose version &>/dev/null; then
    echo "❌ Docker Compose is not available. Please use Docker 20.10+ or install docker-compose."
    return 1
fi

echo "🐳 Bringing up local Kafka cluster (3 brokers, KRaft mode)..."
run_or_exit docker compose up -d

echo ""
echo "👉 Kafka (KRaft mode) cluster is running on:"
echo "   - Broker 1: localhost:9092"
echo "   - Broker 2: localhost:9094"
echo "   - Broker 3: localhost:9096"
echo ""
echo "👉 To stop the cluster, run: docker compose down"
echo "👉 To deactivate the Python environment, run: deactivate"
echo "👉 Current Python: $(which python)"
echo "👉 Current Pip:    $(which pip)"