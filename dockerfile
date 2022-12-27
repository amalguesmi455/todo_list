FROM python:3

ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY ./app /app

EXPOSE 8000

RUN pip install --upgrade pip  

COPY requirements.txt .

RUN pip install -r requirements.txt
COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

