FROM python:3.8-slim-buster

# Install dependencies using apt-get
RUN apt-get update && apt-get install -y \
    awscli \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set non-root user (optional for security)
RUN useradd -m appuser
USER appuser

# Run the application
CMD ["python3", "app.py"]
