FROM ubuntu:16.04
RUN apt-get update && \
        apt-get install -y software-properties-common && \
        add-apt-repository ppa:deadsnakes/ppa && \
        apt-get update -y  && \
        apt-get install -y build-essential python3.6 python3.6-dev python3-pip && \
        apt-get install -y git  && \
# update pip
        python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel
# install elastalert

RUN mkdir -p /opt/mdbook
RUN mkdir -p /opt/wiki
WORKDIR /opt/mdbook
RUN wget https://github.com/crimsoncore/mdbook_docker/blob/master/mdbook-v0.3.5-x86_64-unknown-linux-gnu.tar.gz?raw=true -O /opt/mdbook/mdbook.tar.gz
RUN tar -xvzf /opt/mdbook/mdbook.tar.gz
RUN rm /opt/mdbook/mdbook.tar.gz
#COPY run.sh /opt/mdbook
RUN wget https://raw.githubusercontent.com/crimsoncore/mdbook_docker/master/run.sh -O /opt/mdbook/run.sh
RUN chmod +x /opt/mdbook/run.sh
ENTRYPOINT "/opt/mdbook/run.sh"

