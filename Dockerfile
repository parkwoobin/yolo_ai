FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install streamlit==1.26.0
RUN pip install bcrypt
RUN pip install cryptography
RUN pip install python-dotenv

RUN pip install openai
RUN pip install langchain
RUN pip install langchain-openai
RUN pip install langchain-community


EXPOSE 8080


CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.headless=true"]
