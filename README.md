# s2i-ci

## Introducció

Aquest projecte permet desplegar els servidors dels mòduls de **Serveis de Xarxes i Internet** i **Seguretat i Alta Disponibilitat** utilitzant **dockers** i tècniques de [**Integració Continua (CI)**](CI-introduccio.md)

En aquest respositori trobarem una carpeta per cada servei en concret:

* [Servei DHCP](ServeisDHCP/README.md)
* [Servei DNS](ServeisDNS/README.md)
* [Servei web](ServeisWeb/README.md)
* [Servei de correu electrònic](ServeisEmail/README.md)
* [Servei de missatgeria instantània](ServeisMI/README.md)
* [Servei d'àudio i vídeo](ServeisAV/README.md)

A cada directori es troba un Dockerfile que descriu la imatge utilitzada per cada un dels serveis. A més a més podem trobar un subdirectori per cada servidor que integra el servei, en aquest subdirectori es trobaren els docker-compose.yml més els fitxers de configuració del servei.

## Preparació de l’amfitrió
### Instal·lació docker
Abans de desplegar els serveis dins un docker el que s'ha de fer la instal·lació del propi docker a l’amfitrió per fer això podem seguir els següents tutorials depenent del sistema.

https://docs.docker.com/engine/install/ubuntu/

A més s'ha de tenir el docker compose instal·lat:
```
apt install docker-compose
```

### Clonació del repositori s2i-ci
Primer de tot s'ha de instal·lar el git:
```
apt install git
```
Després s'ha de clonar el repositori:
```
git clone https://github.com/josemmol/s2i-ci.git
```
