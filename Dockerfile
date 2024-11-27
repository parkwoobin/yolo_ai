# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable for Streamlitaz webapp config container set --resource-group YOLOAppResourceGroup --name YOLOAppService --docker-custom-image-name <your_acr_name>.azurecr.io/yoloapp:latest --docker-registry-server-url https://<your_acr_name>.azurecr.io --docker-registry-server-user <username> --docker-registry-server-password <password>
ENV PORT=80

# Run Streamlit app when the container launches
CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]