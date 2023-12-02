FROM ubuntu:22.04

#et aussi mysql car c'est ce qui nous interesse
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mysql-client -y

RUN apt-get install cron -y

COPY cron/crontabs /etc/crontabs/root

RUN chown root:root /etc/crontabs/root && \
	chmod 600 /etc/crontabs/root
	
COPY cron/save_hebdo.sh /save_hebdo.sh

CMD ["cron", "-f"]
