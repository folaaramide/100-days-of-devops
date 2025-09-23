# Use official Python 3.10 slim image as base
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy only requirements.txt first to leverage Docker cache
COPY src/requirements.txt ./requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY src/ .

# Expose port 6100 (application listens here)
EXPOSE 6100

# Command to run the application
CMD ["python3", "server.py"]
