FROM python:3.9.16-buster

WORKDIR /telegram-api

RUN curl -L -o forest.sav "https://www.dropbox.com/s/m9sbnrg64p78nwy/forest.sav?dl=1"

COPY requirements.txt .

RUN mkdir logs && apt-get update && apt-get install -y --no-install-recommends \
    wget 

RUN pip install logrus

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt 

COPY . .

ENTRYPOINT [ "python", "/telegram-api/app.py" ]

