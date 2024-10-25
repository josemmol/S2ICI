## Seleccio de la imatge base
# Especificam un ubunt 22.04
FROM ubuntu:24.04

# Iniciam la instalacio del servei bind9
RUN apt-get update -y && \
    apt install kea supervisor -y && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /var/lib/kea && \
    mkdir -p /var/run/kea


## Execucio de les instruccions per arrancar el contenidor
# Montam les carpetes persistents
VOLUME ["/etc/kea", "/etc/suvervisor", "/var/lib/kea"]

# Exposam els port utilizats
EXPOSE 8000-8001/tcp 67/tcp 67/udp

# Defineix l'ENTRYPOINT per executar el servei KEA DHCP
#ENTRYPOINT ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf"]
#ENTRYPOINT ["tail", "-f"]

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
HEALTHCHECK CMD [ "supervisorctl", "status" ]
