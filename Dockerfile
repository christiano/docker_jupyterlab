FROM python:3.8 AS chrbuilder
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential gcc
RUN apt-get -y  install unixodbc-dev

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

FROM python:3.8-slim
COPY --from=chrbuilder /opt/venv /opt/venv

WORKDIR /devel

ENV PATH="/opt/venv/bin:$PATH"

EXPOSE 8888

CMD ["jupyter","lab","--ip=0.0.0.0","--port=8888","--no-browser","--allow-root"]
