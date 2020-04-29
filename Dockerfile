FROM alpine:3.7

# Get the lastest kubectl version from https://storage.googleapis.com/kubernetes-release/release/stable.txt
ARG K8S_VERSION=v1.18.2

# Install kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -x && \
    apk add --no-cache curl ca-certificates bash && \
    chmod +x /usr/local/bin/kubectl 

ENTRYPOINT ["/usr/local/bin/kubectl"]
CMD [ "--help" ]