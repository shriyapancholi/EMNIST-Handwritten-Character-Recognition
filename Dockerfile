# Use a compact python base suitable for TF (or choose a TF base)
FROM python:3.10-slim

# Allow apt installs for system deps for opencv
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libglib2.0-0 libsm6 libxrender1 libxext6 \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy files
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

# Copy application code
COPY . /app

# Expose port (Vercel will set PORT env)
EXPOSE 7860

# Start the app
CMD ["python", "first_file.py"]