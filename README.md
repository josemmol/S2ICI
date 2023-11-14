# S2ICI

## Introducció

Aquest projecte permet desplegar els servidors dels mòduls de **Serveis de Xarxes i Internet** i **Seguretat i Alta Disponibilitat** utilitzant **dockers** i tècniques de **Integració Continua (CI) **

## Integració continua
### Què és la Integració Contínua?

Definició: La integració contínua (IC) amb Docker és una pràctica de desenvolupament de software que utilitza la tecnologia de contenidors proporcionada per Docker per automatitzar el procés de construcció, testeig i desplegament del codi font en diverses etapes del cicle de vida dels serveis.

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