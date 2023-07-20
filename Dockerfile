FROM kalilinux/kali-rolling:latest
LABEL description="Kali Linux Docker Container with Desktop (via Browser)"

ARG KALI_METAPACKAGE=core
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install kali-tools-${KALI_METAPACKAGE} || apt-get -y install kali-linux-${KALI_METAPACKAGE}
RUN apt-get clean

ARG KALI_DESKTOP=xfce
RUN apt-get -y install kali-desktop-${KALI_DESKTOP}
RUN apt-get -y install tightvncserver dbus dbus-x11 novnc net-tools zsh vim

ENV USER root

RUN apt-get remove xfce4-power-manager -y
RUN apt-get clean
RUN apt-get autoremove -y
RUN chsh -s $(which zsh)

ENV VNCEXPOSE 0
ENV VNCPORT 5900
ENV VNCPWD changeme
ENV VNCDISPLAY 2560x1440
ENV VNCDEPTH 16
ENV NOVNCPORT 8080
COPY ./web/ /usr/share/novnc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
