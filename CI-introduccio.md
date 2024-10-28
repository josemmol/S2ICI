# s2i-ci
## Index
<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Introducció](#introducció)
- [Integració continua](#integració-continua)
   * [Què és la Integració Contínua?](#què-és-la-integració-contínua)
   * [Beneficis de la Integració Contínua:](#beneficis-de-la-integració-contínua)
   * [Fases de la Integració Contínua amb docker](#fases-de-la-integració-contínua-amb-docker)
- [Control de Versions amb Git](#control-de-versions-amb-git)
   * [Què és el Control de Versions?](#què-és-el-control-de-versions)
   * [Beneficis del Control de Versions](#beneficis-del-control-de-versions)
   * [Principals Conceptes de Git](#principals-conceptes-de-git)
- [Instruccions Bàsiques amb Git](#instruccions-bàsiques-amb-git)
- [Introducció a Docker](#introducció-a-docker)
   * [Què és Docker?](#què-és-docker)
   * [Beneficis de Docker](#beneficis-de-docker)
   * [Components clau de Docker](#components-clau-de-docker)
   * [Instruccions Bàsiques de Docker](#instruccions-bàsiques-de-docker)
   * [Dockerfile](#dockerfile)
   * [Docker compose](#docker-compose)

<!-- TOC end -->

## Introducció

Aquest projecte permet desplegar els servidors dels mòduls de **Serveis de Xarxes i Internet** i **Seguretat i Alta Disponibilitat** utilitzant **dockers** i tècniques de **Integració Continua (CI)**

## Integració contínua
### Què és la Integració Contínua?

**Definició:** La integració contínua (IC) amb Docker és una pràctica de desenvolupament de software que utilitza la tecnologia de contenidors proporcionada per Docker per automatitzar el procés de construcció, testeig i desplegament del codi font en diverses etapes del cicle de vida dels serveis.

### Beneficis de la Integració Contínua:

* Reducció de conflictes d'integració.
*Detecció ràpida d'errors.
* Millora de la qualitat del codi.
* Acceleració del temps de lliurament.

### Fases de la Integració Contínua amb docker
Les fases de la integració contínua (IC) aprofita les característiques de contenidors de Docker i assegurar una implementació eficient i reproduïble. Aquí tens les fases comunes en la IC amb Docker:

1. Desenvolupament Local:
   * Desenvolupament del codi en entorns locals mitjançant eines com Docker Compose per simular la infraestructura de producció.
   * Definir els paràmetres de configuració del contenidor.
   * Creació d'un Dockerfile per definir la configuració del contenidor.
   * Creació del docker-compose.yml per definir la persistència.

1. Control de Versions i Repositoris de Docker:
   * Emmagatzematge del codi i dels fitxers de configuració del contenidor Docker en un sistema de control de versions (com Git).

1. Automatització de Tests Locals:
   * Configuració de tests locals per assegurar la funcionalitat correcta dels components Docker.
   * Utilització d'eines com Docker Compose per a orquestar i executar tests d'integració.

1. Construcció Automàtica d'Imatges Docker:
   * Creació d'un pipeline que automatitzi la construcció d'imatges Docker des del Dockerfile.
   * Emmagatzematge d'aquestes imatges en un registre Docker (Docker Hub, registre privat, etc.).

1. Desplegament Automàtic en Entorns de Prova:
   * Configuració d'un entorn de proves amb Docker Compose.
   * Desplegament automatitzat de les imatges Docker construïdes en aquest entorn per validar la integració correcta.

1. Anàlisi Estàtica del Contenidor:
   * Utilització d'eines com Clair per a l'escaneig de seguretat de les imatges Docker.
   * Anàlisi estàtica dels contenidors per identificar possibles vulnerabilitats.

1. Desplegament Automàtic en Entorns de Producció:
   * Configuració d'un entorn de producció mitjançant eines com Docker Swarm o Kubernetes.
   * Desplegament automatitzat de les imatges Docker a l'entorn de producció.

1. Monitoratge del Contenidor:
   * Configuració de solucions de monitoratge com Prometheus o Grafana per a supervisar la salut dels contenidors en temps real.
   * Establiment de mètriques per a la detecció ràpida de problemes.

1. Retroalimentació i Optimització Continues:
   * Recopilació de dades i retroalimentació de la producció per a la millora contínua.
   * Optimització de l'estructura del contenidor, la configuració i els processos en funció dels resultats i les necessitats.

## Control de Versions amb Git
### Què és el Control de Versions?
**Definició:** El control de versions és un sistema que registra els canvis en un fitxer o conjunt de fitxers al llarg del temps, de manera que es pugui accedir a versions específiques més endavant.

### Beneficis del Control de Versions
* **Històric:** Seguiment detallat de canvis.
* **Col·laboració:** Facilita el treball en equip.
* **Seguretat:** Possibilitat de restaurar 
* **Distribuït:** Cada col·laborador té una còpia local de tot el projecte.
* **Ràpid:** Accés local i eficient a les versions.
* **Flexible:** Adaptable a diferents fluxos de treball.

### Principals Conceptes de Git
1. Repository (Repositori):
   * Emmagatzema tota la història del projecte
   * Pot ser local o remot (en serveidors com GitHub).
1. Commit:
   * Un punt en la història del projecte.
   * Conté canvis específics en fitxers.
1. Branch (Branca):
   * Una línia de desenvolupament separada.
   * Facilita el treball simultani en funcionalitats diferents.
1. Merge (Fusionar):
   * Combinar canvis de dues branques diferents.

## Instruccions Bàsiques amb Git
`git init`: Inicia un nou repositori a la carpeta actual.

`git clone URL`: Crea una còpia local d'un repositori remot.

`git add nom_fitxer`: Afegeix canvis d'un fitxer a l'àrea d'espera.

`git commit -m "Missatge del commit"`: Emmagatzema canvis a la història del repositori.
> El missatge descriu els canvis realitzats.

`git push origin branca`: Puja els canvis locals a una branca remota.

`git pull origin branca:` Actualitza la branca local amb els canvis remots.

`git merge branca:` Fusiona els canvis d'una branca a una altra.

## Introducció a Docker
### Què és Docker?
Docker és una plataforma de codi obert dissenyada per a facilitar la creació, implementació i execució d'aplicacions en contenidors. Els contenidors permeten empaquetar una aplicació i totes les seves dependències en una única unitat, assegurant que s'executi de manera consistent en qualsevol entorn.

### Beneficis de Docker
1. **Portabilitat:** Els contenidors són independents de l'entorn, la qual cosa facilita l'execució d'aplicacions en qualsevol màquina que tingui Docker instal·lat.
1. **Eficiència:** Els contenidors comparteixen el sistema operatiu host i consumeixen menys recursos en comparació amb les màquines virtuals tradicionals.
1. **Escalabilitat:** Docker permet escalar fàcilment aplicacions en agregar o llevar contenidors, segons les necessitats de càrrega de treball.
1. **Desenvolupament ràpid:** Els contenidors permeten als desenvolupadors treballar en entorns aïllats, evitant problemes de compatibilitat entre entorns de desenvolupament i producció.

### Components clau de Docker
1. **Docker Engine:** És el component principal que facilita la creació i execució de contenidors. Inclou un servidor i una API que gestiona els contenidors.
1. **Docker Image:** Una imatge és un paquet lleuger i executable que inclou el codi de l'aplicació, les seves dependències i qualsevol configuració necessària per a executar-se.
1. **Contenidor:** Una instància executable d'una imatge. Els contenidors executen aplicacions de manera aïllada i comparteixen el kernel del sistema operatiu subjacent.
1. **Docker Hub:** Un registre en línia que permet emmagatzemar i compartir imatges de Docker. També pots utilitzar repositoris privats per a gestionar les teves pròpies imatges.

### Instruccions Bàsiques de Docker
`docker pull <nombre de imagen>`: Descàrrega una imatge de Docker des de Docker Hub.

`docker build -t <nombre de imagen> .`: Construeix una imatge a partir d'un Dockerfile en el directori actual.

`docker run <nombre de imagen>`: Crea i executa un contenidor basat en una imatge específica.

`docker ps`: Mostra els contenidors en execució.

`docker ps -a`: Mostra **tots** els contenidors.

`docker stop <ID del contenedor>`: Deté un contenidor en execució.

`docker start <ID del contenedor>`: Deté un contenidor en execució.

`docker exec -it <ID del contenedor> /bin/bash`: Entrà a la consola del contenidor. 

### Dockerfile

Un Dockerfile és un script que conté un conjunt d'instruccions per a construir una imatge Docker. Les imatges del contenidor són paquets lleugers, independents i executables que inclouen tot el necessari per a executar un tros de programari. A continuació es mostra una estructura bàsica i una explicació d'un Dockerfile:

```
# Use an official base image. This example uses the official Node.js image from the Docker Hub.
FROM node:14
# Set the working directory inside the container. This will be the base directory for all subsequent commands.
WORKDIR /app
# Copy package.json and package-lock.json to the working directory.
COPY package*.json ./
# Install app dependencies.
RUN npm install
# Copy the application code to the working directory.
COPY . .
# Expose a port that the container will listen on. This does not publish the port, but documents its existence.
EXPOSE 3000
# Define environment variables.
ENV NODE_ENV=production
# Command to run the application. This is the entry point for the container.
CMD ["npm", "start"]
```

Per a construir una imatge des d'aquest Dockerfile, deseu-la com a Dockerfile i executeu l'ordre següent al mateix directori:

```
docker build -t your-image-name .
```
Reemplaça el nom de la imatge amb el nom desitjat per a la imatge Docker. Després de construir la imatge, podeu executar un contenidor des d'ell utilitzant acoblador executa.

### Docker compose
Docker Compose és una eina per definir i executar aplicacions Docker multicontenidor. Permet definir els serveis, xarxes i volums en un sol fitxer, facilitant la gestió i el desplegament d'aplicacions complexes. Aquí hi ha un fitxer bàsic de Docker Compose amb comentaris que expliquen cada secció:

```
version: '3'  # Docker Compose version

services:    # List of services/containers

  web:       # Service named 'web'
    image: nginx:alpine  # Docker image to use
    ports:
      - "8080:80"        # Port mapping (host:container)
    volumes:
      - ./html:/usr/share/nginx/html  # Mount local directory into the container

  api:
    image: your-api-image:latest  # Replace with your API image and tag
    ports:
      - "3000:3000"
    depends_on:
      - database

  database:
    image: postgres:latest
    environment:
      POSTGRES_DB: mydatabase
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
    volumes:
      - pgdata:/var/lib/postgresql/data  # Named volume for persisting data

volumes:
  pgdata:  # Definition of the named volume
```

Per a utilitzar aquest fitxer Docker Compose, deseu-lo com a docker-compose.yml i executeu l'ordre següent al mateix directori:

```
docker-compose up
```

Aquesta ordre llegeix el fitxer docker-compose.yml, crea els serveis definits i inicia els contenidors. 

Per aturar i eliminar contenidors, utilitzau:

```
docker-compose down
```

Per aturar i eliminar contenidors i les seves imatges, utilitzau:

```
docker-compose down --rmi all
```

Aquest és un exemple bàsic, i pots personalitzar-lo en funció dels requisits de la teva aplicació.


