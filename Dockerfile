FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y wget curl tar screen lib32gcc-s1 iputils-ping netcat-openbsd \
 && apt clean

WORKDIR /home/css
COPY start.sh /home/css/start.sh
RUN chmod +x /home/css/start.sh

EXPOSE 27015/udp
CMD ["bash","/home/css/start.sh"]
