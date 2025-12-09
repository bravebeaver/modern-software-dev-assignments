# Assignments for CS146S: The Modern Software Developer

This is the home of the assignments for [CS146S: The Modern Software Developer](https://themodernsoftware.dev), taught at Stanford University fall 2025.

## Development Environment Setup

### 🚀 Quick Start with VS Code Dev Containers (Recommended)

The simplest way to get started is using VS Code with Dev Containers. This provides a consistent environment with Python 3.12, Poetry, and all dependencies pre-configured.

1. **Prerequisites**
   - Install [VS Code](https://code.visualstudio.com/)
   - Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Setup**
   - Open this project folder in VS Code
   - Press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Windows/Linux)
   - Type and select: **"Dev Containers: Reopen in Container"**
   - Wait for the container to build (first time takes a few minutes)

3. **Start Development**
   - Open a VS Code terminal (Terminal → New Terminal)
   - Navigate to any week and run the application:
   ```bash
   # Week 1: AI/ML techniques (no server needed)
   cd week1
   python rag.py  # or any other technique file
   
   # Week 2: Basic FastAPI app
   cd week2
   poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
   
   # Week 4-7: Full-stack applications  
   cd week4  # or week5, week6, week7
   make run
   # Alternative: poetry run uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload
   ```
   - Visit http://localhost:8000 in your browser (for weeks 2, 4-7)

That's it! Your environment includes Python 3.12, Poetry, FastAPI, SQLAlchemy, OpenAI, Ollama, and all development tools (Black, Ruff, Pytest, Pre-commit).

### 🛠 Alternative Setup Methods

If you prefer using Docker directly:

**Docker (if you prefer command line)**
```bash
./start.sh           # Runs week 4 on port 8000
./start.sh 2         # Runs week 2 on port 8000  
./start.sh 5 8001    # Runs week 5 on port 8001
```

### 📋 Manual Setup (Original Method)

If you prefer local installation without containers:

1. Install Anaconda
   - Download and install: [Anaconda Individual Edition](https://www.anaconda.com/download)
   - Open a new terminal so `conda` is on your `PATH`.

2. Create and activate a Conda environment (Python 3.12)
   ```bash
   conda create -n cs146s python=3.12 -y
   conda activate cs146s
   ```

3. Install Poetry
   ```bash
   curl -sSL https://install.python-poetry.org | python -
   ```

4. Install project dependencies with Poetry (inside the activated Conda env)
   From the repository root:
   ```bash
   poetry install --no-interaction
   ```

## Available Applications

- **Week 1**: AI/ML techniques (chain of thought, RAG, etc.)
- **Week 2**: Basic FastAPI app with notes and action items
- **Week 4-7**: Full-stack applications with SQLite backend and HTML frontend

## 📖 Additional Documentation

- See [DEVELOPMENT.md](DEVELOPMENT.md) for detailed setup instructions and troubleshooting
- Each week folder contains its own `assignment.md` with specific requirements