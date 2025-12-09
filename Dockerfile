# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV POETRY_NO_INTERACTION=1
ENV POETRY_VENV_IN_PROJECT=1
ENV POETRY_CACHE_DIR=/tmp/poetry_cache

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    make \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install poetry

# Copy Poetry files
COPY pyproject.toml poetry.lock* ./

# Install Python dependencies (including dev dependencies for development)
RUN poetry install && rm -rf $POETRY_CACHE_DIR

# Copy project files
COPY . .

# Create data directory for SQLite databases
RUN mkdir -p data

# Expose port 8000 for FastAPI applications
EXPOSE 8000

# Default command - just start bash for interactive development
CMD ["/bin/bash"]