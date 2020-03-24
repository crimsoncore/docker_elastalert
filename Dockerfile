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
RUN apt-get update && \
        apt-get install -y curl wget
# Install elastalert
RUN pip3 install --ignore-installed PyYAML
RUN python3 -m pip install elastalert
#Create default directories
RUN mkdir -p /opt/elastalert
RUN mkdir -p /opt/elastalert/rules
RUN mkdir -p /opt/elastalert/config
RUN mkdir -p /opt/elastalert/log
WORKDIR /opt/elastalert
#COPY run.sh /opt/elastalert
RUN wget https://raw.githubusercontent.com/crimsoncore/docker_elastalert/master/run.sh -O /opt/elastalert/run.sh
RUN chmod +x /opt/elastalert/run.sh
ENTRYPOINT "/opt/elastalert/run.sh"

