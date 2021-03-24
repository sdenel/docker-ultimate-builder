FROM docker:latest
 # Docker image is based on Alpine, and Docker is relatively complicated to install afterward 
COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh && /opt/setup.sh
ENV PATH="/root/bin/fill-yaml-from-env:${PATH}"


