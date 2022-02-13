FROM python:3.8

ADD ./packages.txt /app/packages.txt
RUN pip install -r /app/packages.txt

ADD ./app.py /app/app.py

WORKDIR /app
CMD ["uvicorn", "--host", "0.0.0.0", "app:app"]
