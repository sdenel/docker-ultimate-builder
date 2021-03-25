FROM docker:latest
RUN apk add containerd && rm -rf /usr/local/bin/containerd # Attempt with an up to date version of containerd
 # Docker image is based on Alpine, and Docker is relatively complicated to install afterward 
COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh && /opt/setup.sh
ENV PATH="/root/bin/fill-yaml-from-env:${PATH}"


