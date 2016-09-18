FROM opensuse:tumbleweed
MAINTAINER Alex Geer <monoflash@gmail.com>

RUN zypper --non-interactive --gpg-auto-import-keys ref
RUN zypper -n up
RUN zypper -n in ca-certificates libappindicator3-1
RUN update-ca-certificates

COPY lantern_linux_amd64 /usr/bin/lantern
RUN chmod +x /usr/bin/lantern

EXPOSE 3128
EXPOSE 16823
ENTRYPOINT ["/usr/bin/lantern", "-configdir=/root", "--headless=true", "--proxyall=true", "--startup=false", "--clear-proxy-settings=false", "--addr=0.0.0.0:3128", "--uiaddr=0.0.0.0:16823"]
