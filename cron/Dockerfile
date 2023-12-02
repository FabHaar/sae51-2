FROM alpine:3.16
#on part de cette image car elle contient deja crond

#on installe tzdata pour choisir correctement un fuseau horaire
#et aussi mysql car c'est ce qui nous interesse
RUN apk update && \
	apk add --no-cache \
		mysql-client
	tzdata && \
	rm -rf /var/cache/apk/*

ENV TZ=Europe/Paris

COPY ./crontabs /etc/crontabs/root

RUN chown root:root /etc/crontabs/root && \
	chmod 600 /etc/crontabs/root
	
COPY ./save_hebdo.sh /save_hebdo.sh
