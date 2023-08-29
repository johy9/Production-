# Stage 1: Build the application
FROM python:3.8-slim as builder

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Stage 2: Create the production container
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Copy the built artifacts from the previous stage
COPY requirements.txt /app/requirements.txt


# Expose port 5000
EXPOSE 5000

# Define the command to start the application
CMD ["python", "app.py"]

