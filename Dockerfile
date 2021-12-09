FROM hashicorp/packer:1.6.5

ARG WINDOWS_UPDATE_VERSION=v0.13.0

ADD https://github.com/rgl/packer-plugin-windows-update/releases/download/${WINDOWS_UPDATE_VERSION}/packer-plugin-windows-update_${WINDOWS_UPDATE_VERSION}_SHA256SUMS ./
ADD https://github.com/rgl/packer-plugin-windows-update/releases/download/${WINDOWS_UPDATE_VERSION}/packer-plugin-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_linux_amd64.zip ./

RUN sed -i '/.*linux_amd64.zip/!d' packer-plugin-windows-update_${WINDOWS_UPDATE_VERSION}_SHA256SUMS && \
    sha256sum -cs packer-plugin-windows-update_${WINDOWS_UPDATE_VERSION}_SHA256SUMS && \
    unzip packer-plugin-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_linux_amd64.zip -d /bin && \
    rm -f packer-plugin-windows-update_${WINDOWS_UPDATE_VERSION}_x5.0_linux_amd64.zip && \
    chmod a+x /bin/packer-plugin-windows-update


https://github.com/rgl/packer-plugin-windows-update/releases/download/v0.13.0/packer-plugin-windows-update_v0.13.0_x5.0_SHA256SUMS
