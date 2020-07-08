FROM gcr.io/kaggle-images/python:v73

RUN apt update && \
    apt install -y python3-venv openssh-server && \
    apt clean

RUN pip install -U pip && \
    pip install fastprogress japanize-matplotlib && \
    pip install pydotplus kaggle jupyter_contrib_nbextensions && \
    pip install jupyter-nbextensions-configurator && \
    jupyter contrib nbextension install && \
    jupyter nbextensions_configurator enable


RUN mkdir /root/.ssh /workdir /run/sshd && \
    chmod 700 /root/.ssh && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

ADD run.sh /opt/run.sh
ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /opt/run.sh && chmod 600 /root/.ssh/authorized_keys

WORKDIR /workdir
CMD /opt/run.sh

