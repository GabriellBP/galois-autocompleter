ARG TENSORFLOW_VERSION=1.14.0-gpu-py3
FROM tensorflow/tensorflow:${TENSORFLOW_VERSION}

WORKDIR /

COPY . /galois
WORKDIR /galois

RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install -r requirements.txt
RUN apt purge -y git curl
RUN apt autoremove --purge -y
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*

RUN chmod 644 main.py
CMD [ "python", "main.py" ]