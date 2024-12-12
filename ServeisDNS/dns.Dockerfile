## Seleccio de la imatge base
# Especificam un ubunt 22.04
FROM ubuntu:24.04

# Iniciam la instalacio del servei bind9
RUN apt-get update -y && \
    apt install bind9 -y

## Ejecucio de les instruccions per arrancar el contenidor
# Montam les carpetes persistents
VOLUME /etc/bind
CMD ["named", "-g"]

# Exposam el port utilizat
EXPOSE 53/udp
EXPOSE 53/tcp
