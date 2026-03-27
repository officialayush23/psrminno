FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV PORT=8080
ENV PYTHONUNBUFFERED=1
EXPOSE 8080
# 2 workers; background tasks need 300s timeout
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", \
     "--workers", "2", "--timeout-keep-alive", "300", "--log-level", "info"]