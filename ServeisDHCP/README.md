# Servei DHCP

## Introducció

Les següents subxarxes tindran servei d'adreçament dinàmic amb DHCP pels servidors Linux i mikrotik respectivament, a excepció de la subxarxa de DelegacioRemota, que serà proveïda d'adreçament dinàmic amb un Relay DHCP.


**Xarxa d’administració / Gestió infraestructura:**
* *adreça xarxa*: 10.18.159.64/28
* *VLAN:* 3528
* *Porta d'enllaç*: 10.18.159.65
* *Adreça difusió*: 10.18.159.95
* *Rang d'adreces IPs fixes*: 10.18.159.65 - 10.18.159.75
* *Rang d'adreces IPs dinàmiques*: 10.18.159.76 - 10.18.159.93
* *Servei DHCP*: Servidor Linux amb isc-kea
* *Adreça IP servidor DHCP*: 10.18.159.66
* *Adreces IPs servidors DNS*: 8.8.8.8, 8.8.4.4

**Quiròfans**
* *adreça xarxa*: 10.18.158.0/26
* *VLAN:* 3500
* *Porta d'enllaç*: 10.18.158.1
* *Adreça difusió*: 10.18.158.63
* *Rang d'adreces IPs fixes*: 10.18.158.1 - 10.18.158.20
* *Rang d'adreces IPs dinàmiques*: 10.18.158.21 - 10.18.158.62
* *Servei DHCP*: Servidor Relay
* *Adreça IP servidor DHCP*: 10.18.159.66
* *Adreces IPs servidors DNS*: 8.8.8.8, 8.8.4.4

**Ambulatori (remota)**
* *adreça xarxa*: 10.18.158.64/26
* *VLAN:* 3564
* *Porta d'enllaç*: 10.18.158.65 
* *Adreça difusió*: 10.18.158.127
* *Rang d'adreces IPs fixes*: 10.18.158.65 - 10.18.158.80
* *Rang d'adreces IPs dinàmiques*: 10.18.158.81 - 10.18.158.126
* *Servei DHCP*: Servidor Relay
* *Adreça IP servidor DHCP*: 10.18.159.66
* *Adreces IPs servidors DNS*: 8.8.8.8, 8.8.4.4


Els serveis de DHCP està implementat a partir de contenidors dockers aquests contenidors es podran desplegar a partir dels fitxers de configuració guardats en aquest repositori.

Els contenidors dockers es desplegaran a partir d'una imatge d'Ubuntu 22.04 i el servei que s’instal·larà seran el de isc-kea.

Els serveis DHCP estarà format per tres dockers:
* dk-kea-DHCP-SERVER-01
* dk-kea-DHCP-RELAY-01
* dk-kea-DHCP-RELAY-02

Al docker *dk-kea-DHCP-SERVER-01* hi haurà la configuració del servei DHCP per a les tres subxarxes *Gestió infraestructura*, *Quiròfans* i *Ambulatori*.

## Preparació de l’ordinador local
Per poder fer les proves en local el que s’ha de fer és tenir el docker instal·lat, a més a més per poder comprovar el funcionament del servei DHCP es crearà una interfície fictícia seguint les següents passes:

Comprovar que el mòdul del kernel **dummy** està carregat
```
lsmod | grep dummy
```

Si no està carregat 
```
sudo modprobe dummy
```

Per crear la intèrficie ficticia i assignar-li una adreça IP s'han d'executar les següents intruccions:
```
sudo ip link add eth0 type dummy
sudo ip address add 10.18.159.66/27 dev eth0
sudo ip link set eth0 up
```

Per comprovar si està activat simplament fer un ping:
```
ping 10.18.159.66
```

Ara simplement crea una màquina virtual amb **VirtuaBox** o **VMWare Workstation** que estigui en mode bridge a la interfície **eth0** i que el sistema operatiu tingui la interfície configurada en mode DHCP.

> Nota: Per fer que aquesta configuració persisteixi després d’un reinici, pots afegir la configuració a **/etc/network/interfaces** o crear una regla **systemd**.

## Referències
Per a configurar el contenidor amb el servei DHCP amb KEA s'ha utilitzat les següents referències:

https://gitlab.isc.org/isc-projects/kea-docker/

http://supervisord.org/
