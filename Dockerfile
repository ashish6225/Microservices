FROM ubuntu:20.04


RUN cd /usr/src/ && mkdir MicroServiceBC 

RUN cd /usr/src/MicroServiceBC && pwd

RUN apt update && apt upgrade -y

RUN  cd /usr/src/MicroServiceBC && ls

RUN apt install software-properties-common -y && add-apt-repository ppa:deadsnakes/ppa  && apt install -y python3.10

RUN echo "export PATH=/usr/bin/python3:\$PATH" >> ~/.bashrc

RUN cat ~/.bashrc

RUN python3 --version   

RUN apt-get install -y python3-pip &&  /usr/bin/pip --version

# RUN apt-get install code -y

RUN apt-get install -y git-all

RUN git --version

RUN cd /usr/src/MicroServiceBC && git clone https://github.com/Vikas098766/Microservices.git

RUN cd /usr/src/MicroServiceBC && apt install -y python3-venv

RUN cd /usr/src/MicroServiceBC/Microservices && ls -ltr

RUN cd /usr/src/MicroServiceBC/Microservices && /usr/bin/pip install -r /usr/src/MicroServiceBC/Microservices/requirements.txt 

RUN cd /usr/src/MicroServiceBC/Microservices && python3 /usr/src/MicroServiceBC/Microservices/code_model_training/train.py

RUN apt install -y curl

RUN cd /usr/src/MicroServiceBC/Microservices && python3 /usr/src/MicroServiceBC/Microservices/app.py
