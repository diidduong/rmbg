FROM python:3.9

COPY u2net.onnx /home/.u2net/u2net.onnx

ENV HOST 0.0.0.0

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app .

EXPOSE 5100

CMD ["python", "app.py"]