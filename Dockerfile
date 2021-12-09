FROM hashicorp/packer:1.6.5

ARG WINDOWS_UPDATE_VERSION=v0.13.0

ADD https://github.com/rgl/packer-provisioner-windows-update/releases/download/${WINDOWS_UPDATE_VERSION}/packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_SHA256SUMS ./
ADD https://github.com/rgl/packer-provisioner-windows-update/releases/download/${WINDOWS_UPDATE_VERSION}/packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_linux_amd64.tar.gz ./

RUN sed -i '/.*linux_amd64.tar.gz/!d' packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_SHA256SUMS && \
    sha256sum -cs packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_SHA256SUMS && \
    tar xvfz packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_linux_amd64.tar.gz -C /bin && \
    rm -f packer-provisioner-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_linux_amd64.tar.gz && \
    chmod a+x /bin/packer-provisioner-windows-update
