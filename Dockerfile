FROM hashicorp/packer:1.6.5

ARG WINDOWS_UPDATE_VERSION=v0.14.0

ADD https://github.com/rgl/packer-provisioner-windows-update/releases/download/v${WINDOWS_UPDATE_VERSION}/packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_checksums.txt ./
ADD https://github.com/rgl/packer-provisioner-windows-update/releases/download/v${WINDOWS_UPDATE_VERSION}/packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_linux_amd64.tar.gz ./

RUN sed -i '/.*linux_amd64.tar.gz/!d' packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_checksums.txt && \
    sha256sum -cs packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_checksums.txt && \
    tar xvfz packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_linux_amd64.tar.gz -C /bin && \
    rm -f packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_linux_amd64.tar.gz && \
    chmod a+x /bin/packer-provisioner-windows-update
