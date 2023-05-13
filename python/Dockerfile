FROM python:3.9

RUN echo 'alias ll="ls -al"' >> /root/.bashrc

ADD ./src /app

WORKDIR /app
RUN pip install -r requirements.txt

CMD ["tail", "-f", "/dev/null"]
