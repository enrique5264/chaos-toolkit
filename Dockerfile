FROM chaostoolkit/chaostoolkit:full
USER root
RUN apt-get update
RUN apt-get -y install curl unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
RUN echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
RUN mkdir -p $HOME/.chaostoolkit
COPY settings.yaml /root/.chaostoolkit
RUN pip install chaostoolkit-kubernetes
RUN pip install chaostoolkit-lib[jsonpath]
RUN pip install -U logzero



