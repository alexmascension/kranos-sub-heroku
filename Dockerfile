FROM ubuntu:20.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
RUN apt-get install -y python3.8 python3-pip python3-requests
RUN pip3 install cellxgene

RUN wget https://zenodo.org/record/4746448/files/joined_sub.h5ad -O /home/joined_sub.h5ad

# ENTRYPOINT ["cellxgene"]  # Heroku doesn't work well with ENTRYPOINT
