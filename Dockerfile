FROM monsantoco/min-jessie:latest

RUN apt-get update && apt-get install -y \
    curl \
    git-core \
    python \
    python-pip \
    zip && \
  rm -rf /usr/share/man /tmp/* /var/lib/apt/lists/*

RUN mkdir -p /home/shippable/setup

RUN pip install virtualenv && \
  pip install awscli && \
  pip install glob2 && \
  pip install pika && \
  echo "true" | tee /deps_updated.txt

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

RUN bash -c ". /root/.nvm/nvm.sh && nvm install v0.10.32"
RUN bash -c ". /root/.nvm/nvm.sh && nvm alias default v0.10.32"

CMD ["/bin/bash", "node"]
