# Servei DNS

## Introducció

En aquesta documentació trobarem informació sobre la configuració dels serveis DNS de l’empresa Hospital d’Inca.
Disseny dels serveis DNS.
Els dos noms de domini de l’empresa son:

hospitalbinissalem.com
quirofans.com 
urgencies.com

El servei DNS està gestionat per dos servidors:
* [Server1](Server1/README.md)
* [Server2](Server2/README.md)

## Definició de les zones
### Requeriments zona hospitalbinissalem.com


|Nom de domini | Tipus de registres | Valor |
|-------------|-----------|-------|
|hospitalbinissalem.com |SOA |Master de domini: admin@hospitalbinissalem.com DNS primari: ns01.hospitalbinissalem.com número de sèrie 2008052001… |
|hospitalbinissalem.com | NS | ns01.hospitalbinissalem.com
|hospitalbinissalem.com | NS |ns02.hospitalbinissalem.com |
|hospitalbinissalem.com | MX | mail1.hospitalbinissalem.com |
|hospitalbinissalem.com | MX | mail2.hospitalbinissalem.com |
|www.hospitalbinissalem.com | CNAME |web.hospitalbinissalem.com |
|ftp.hospitalbinissalem.com | CNAME | file.hospitalbinissalem.com |
ns01.hospitalbinissalem.com | A | 192.168.158.225 |
|ns02.hospitalbinissalem.com |A | 192.168.158.224 |
| mail1.hospitalbinissalem.com | A | 192.168.158.226 |
|mail2.hospitalbinissalem.com | A |192.168.158.227 |
|web.hospitalbinissalem.com | A | 192.168.158.228 |
|file.hospitalbinissalem.com | A | 192.168.158.229 |
| estacions.hospitalbinissalem.com | NS |ns01.hospitalbinissalem.com |
| estacions.hospitalbinissalem.com | NS |ns02.hospitalbinissalem.com |


### Requeriments zona estacions.hospitalbinissalem.com

|Nom de domini|Tipus de registres|Valor|
|-------------|-----------|-------|
|estacions.hospitalbinissalem.com | SOA | Master de domini: admin@hospitalbinissalem.com DNS primari: ns01.hospitalbinissalem.com
número de sèrie 2008052001 |
|estacions.hospitalbinissalem.com | NS | ns01.hospitalbinissalem.com |
|estacions.hospitalbinissalem.com | NS | ns02.hospitalbinissalem.com
| est01.estacions.hospitalbinissalem.com | A | 10.18.158.1 |
|est02.estacions.hospitalbinissalem.com | A |
10.18.158.2 |
| est03.estacions.hospitalbinissalem.com | A | 110.18..158.3 |
| est04.estacions.hospitalbinissalem.com | A | 10.18..158.4 |
| est05.estacions.hospitalbinissalem.com | A | 10.18..158.5 |
| est06.estacions.hospitalbinissalem.com | A | 10.18.158.6 |

### Requeriments zona inversa per l’adreça 10.18.158.0/24 

|Nom de domini | Tipus de registres | Valor
|-------------|-----------|-------|
|158.18.10.in-addr.apra | SOA | Master de domini: admin@jservers.com DNS primari: ns01.hospitalbinissalem.com número de sèrie 2008052001 … |
|158..18.10.in-addr.apra | NS | ns01.hospitalbinissalem.com |
|158.18.10.in-addr.apra | NS | ns02.hospitalbinissalem.com |
|1.158.18.10.in-addr.apra | PTR | est01.estacions.hospitalbinissalem.com |
|2.158.18.10.in-addr.apra| PTR | est02.estacions.hospitalbinissalem.com |
| 3.158.18.10.in-addr.apra | PTR | est03.estacions.hospitalbinissalem.com |
| 4.158.18.10.in-addr.apra | PTR | est04.estacions.hospitalbinissalem.com |
| 5.158..18.10.in-addr.apra | PTR | est05.estacions.hospitalbinissalem.com |
| 6.158.18.10.in-addr.apra | PTR | est06.estacions.hospitalbinissalem.com

### Requeriments zona quirofans.com
????completar

### Requeriments zona estacions.quirofans.com
????completar


## Arquitectura del servei DNS

Els serveis DNS estaran implantats sobre un docker cada un dells implantats al proxmox.

El servei DNS està gestionat per dos servidors:
* [Server1](Server1/README.md)
* [Server2](Server2/README.md)

El server1 serà mestra del domini **hospitalbinissalem.com** i secundari del domini **quirofans.com**

El server2 serà esclau del domini **hospitalbinissalem.com** i mestre del domini **quirofans.com**


## Preparació de l'anfitrio 
Alguns sistemes linux el sistema de resolved està lligat a un servei que es troba lligat al port 53.
```
root@lxc-ub-gestio-01:~# ss -ua
State    Recv-Q   Send-Q     Local Address:Port             Peer Address:Port         Process         
UNCONN   0        0          127.0.0.53%lo:domain                0.0.0.0:*                            
UNCONN   0        0                0.0.0.0:bootps                0.0.0.0:*                            
```
En aquests casos s'ha de deshabilitar el servei.
Per a un ubuntu server s'han de fer les següents passes:
```
systemctl stop systemd-resolved
systemctl disable systemd-resolved
```
Per a un ubuntu desktop s'han de fer les següents passes:


1. Comprova l'estat actual del servei DNS (systemd-resolved):
   ```
   sudo systemctl status systemd-resolved
   ```
1. Atura el servei DNS si està en execució:
   ```
   sudo systemctl stop systemd-resolved
   ```
1. Desactiva el servei perquè no s'iniciï automàticament al reiniciar:
   ```
   sudo systemctl disable systemd-resolved
   ```

1. Desassigna el port 53 a través d'un fitxer de configuració personalitzat:
   
   Crea un fitxer de configuració personalitzat. Per exemple, utilitzant l'editor nano:
   ```
   sudo nano /etc/systemd/resolved.conf
   ```
   Afegir la següent línia per desassignar el port 53:

   `DNSStubListener=no`

    Desa i tanca l'editor.

1. Reinicia el sistema o inicia el servei systemd-resolved manualment:
   ```
   sudo systemctl start systemd-resolved
   sudo systemctl enable systemd-resolved
   ```
Ara el servei DNS systemd-resolved ja no escoltarà al port 53. Si necessites més personalització o si estàs utilitzant un servidor DNS diferent, pots ajustar la configuració segons les teves necessitats.