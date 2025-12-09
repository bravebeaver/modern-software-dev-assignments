# Development Environment Setup

This document provides comprehensive setup instructions for the Modern Software Dev assignments course.

## Option 1: VS Code Dev Containers (Recommended)

The simplest and most reliable setup for the course:

1. **Install Prerequisites**
   - [VS Code](https://code.visualstudio.com/)
   - [Docker Desktop](https://www.docker.com/products/docker-desktop/)
   - [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Setup Environment**
   - Open the project folder in VS Code
   - Press `Cmd+Shift+P` and select "Dev Containers: Reopen in Container"
   - Wait for the container to build (includes Python 3.12, Poetry, and all dependencies)

3. **Additional Setup for Week 1 (Ollama)**
   - **Important**: Ollama needs to run on your host machine, not in the container
   - On your host machine (outside VS Code):
   ```bash
   # Install Ollama
   # macOS: brew install --cask ollama
   # Linux: curl -fsSL https://ollama.com/install.sh | sh
   # Windows: Download from ollama.com/download
   
   # Pull required models (only once)
   ollama pull mistral-nemo:12b
   ollama pull llama3.1:8b
   
   # Start Ollama service
   ollama serve
   ```

4. **Run Applications**
   ```bash
   # Week 1: AI/ML techniques
   cd week1
   python rag.py  # or any technique file
   
   # Week 2: Basic FastAPI
   cd week2
   poetry run uvicorn app.main:app --reload
   
   # Week 4-7: Full-stack apps
   cd week4  # or week5, week6, week7
   make run
   ```

## Option 2: Docker

For command-line users who prefer Docker directly:

### Quick Start
```bash
# Week 2
./start.sh 2

# Week 4 (default)  
./start.sh

# Week 5 on different port
./start.sh 5 8001
```

**Note**: Week 1 requires Ollama on your host machine (see Option 3 below).

## Option 3: Manual Setup (Original Method)

Complete local installation following the original course setup:

1. **Install Anaconda**
   - Download: [Anaconda Individual Edition](https://www.anaconda.com/download)

2. **Create Python Environment**
   ```bash
   conda create -n cs146s python=3.12 -y
   conda activate cs146s
   ```

3. **Install Poetry**
   ```bash
   curl -sSL https://install.python-poetry.org | python -
   ```

4. **Install Dependencies**
   ```bash
   poetry install --no-interaction
   ```

5. **Install Ollama (for Week 1)**
   ```bash
   # macOS
   brew install --cask ollama
   
   # Linux  
   curl -fsSL https://ollama.com/install.sh | sh
   
   # Windows: Download from ollama.com/download
   
   # Pull models
   ollama pull mistral-nemo:12b
   ollama pull llama3.1:8b
   ```

## Course Structure & Applications

- **Week 1**: AI/ML prompting techniques (Chain-of-thought, RAG, Tool calling, etc.)
  - Requires: Python, Ollama
  - Run: `python <technique_file>.py`

- **Week 2**: FastAPI + SQLite action item extractor  
  - Run: `poetry run uvicorn app.main:app --reload`

- **Week 3**: Custom MCP Server
  - Varies by implementation

- **Week 4-7**: Full-stack applications with FastAPI backend, SQLite, HTML frontend
  - Run: `make run` or `poetry run uvicorn backend.app.main:app --reload`
  - Features: Notes, Action Items, SQLAlchemy ORM, Static frontend

- **Week 8**: Multi-stack AI-accelerated web app builds
  - Uses external platforms (bolt.new, etc.)

## Available Ports

- Default: http://localhost:8000
- Alternative ports: Use `./start.sh <week> <port>` for Docker setup

## Development Tools Included

- **Python 3.12**: Latest supported version
- **Poetry**: Dependency management  
- **FastAPI**: Web framework
- **SQLAlchemy**: Database ORM
- **Pydantic**: Data validation
- **OpenAI**: AI API client
- **Ollama**: Local LLM support
- **Black**: Code formatting
- **Ruff**: Fast Python linting  
- **Pytest**: Testing framework
- **Pre-commit**: Git hooks for code quality

## Troubleshooting

### VS Code Dev Container Issues
- Ensure Docker Desktop is running
- Try "Dev Containers: Rebuild Container" if dependencies seem missing

### Docker Issues  
- Rebuild with: `docker build --no-cache -t modern-software-dev .`
- Check Docker Desktop is running

### Ollama Issues
- Ensure ollama service is running: `ollama serve`
- Check models are pulled: `ollama list`
- Week 1 requires Ollama on host machine, not in containers

### Port Conflicts
- Use different ports: `./start.sh <week> <port>`
- Check for other applications using port 8000

### Permission Issues
- Make start script executable: `chmod +x start.sh`