# ------- Base Image --------- 
FROM python:3.11-slim

# Prevent python from buffering
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1 
ENV PYTHONPATH=/app

# Working directory
WORKDIR /app 

# Install dependency first 
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt 

RUN pip install --upgrade pip

# Copy application
COPY src ./src 

# Expose application port 
EXPOSE 5000

# Production server
CMD ["gunicorn", "-b", "0.0.0.0:5000", "src.app:app"]
