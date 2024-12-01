FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080


CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.headless=true"]
