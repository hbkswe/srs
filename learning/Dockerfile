FROM ossrs/srs:ubuntu20
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      rsync \
      openssh-client \
      docker.io \
      git \
      build-essential \
      cmake \
      pkg-config \
      python3 \
      python3-pip \
      curl \
      wget \
      ca-certificates \
      vim \
      less \
    && rm -rf /var/lib/apt/lists/*
