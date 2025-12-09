#!/bin/bash

# Quick start script for Modern Software Dev Assignments

echo "🚀 Starting Modern Software Dev Environment..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    exit 1
fi

# Build the Docker image
echo "📦 Building Docker image..."
docker build -t modern-software-dev .

# Check if we want to run a specific week
WEEK=${1:-4}
PORT=${2:-8000}

echo "🏃 Running Week ${WEEK} application on port ${PORT}..."

# Determine the correct command based on week
if [ "$WEEK" = "2" ]; then
    # Week 2 uses simple uvicorn command
    docker run -it --rm \
        -p ${PORT}:8000 \
        -v "$(pwd):/app" \
        -v /app/.venv \
        -e PYTHONPATH=/app \
        -w /app/week2 \
        modern-software-dev \
        poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
else
    # Week 4-7 can use make run
    docker run -it --rm \
        -p ${PORT}:8000 \
        -v "$(pwd):/app" \
        -v /app/.venv \
        -e PYTHONPATH=/app \
        -w /app/week${WEEK} \
        modern-software-dev \
        make run
fi

echo "✅ Application should be running at http://localhost:${PORT}"