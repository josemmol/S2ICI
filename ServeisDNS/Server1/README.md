# Server1 del servei DNS

## Introducció

El servidor sever1 és un servidor DNS primari de hopitalbinissalem.com
???

## Abans de fer el docker-compose comprova el següent

Here are the steps to check and stop the service using port 53:

1. **Check which service is using port 53:**
   ```sh
   sudo lsof -i :53
   ```

2. **Stop the service using port 53:**
   If the service is `systemd-resolved`, you can stop it using:
   ```sh
   sudo systemctl stop systemd-resolved
   ```

3. **Disable the service to prevent it from starting on boot:**
   ```sh
   sudo systemctl disable systemd-resolved
   ```

4. **Restart Docker container:**
   ```sh
   docker-compose up -d
   ```

Alternatively, you can change the port mapping in your Docker configuration to use a different port on the host machine. For example, you can map port 1053 on the host to port 53 in the container:

1. **Update your `docker-compose.yml` file:**
   ```yaml
   services:
     dns-hospitalbinissalem:
       ports:
         - "1053:53/tcp"
         - "1053:53/udp"
   ```

2. **Restart Docker container:**
   ```sh
   docker-compose up -d
   ```

Choose the approach that best fits your needs.
Aquest servidor es desplega amb el docker-compose.yml