## Portainer

[Portainer](https://www.portainer.io/) is a multi-cluster and multi-device support means you can manage environments of any type, anywhere (Docker and Kubernetes, running on dev laptops, in your DC, in the cloud, or at the edge), and we don't require you to run any specific Kubernetes distro.

## Installing Portainer

To install Portainer, we must need to first install [Docker](https://docs.docker.com/get-started/docker-overview/) For this demo, we will be skipping the docker installation but you can follow the step-by-step guide on my [Docker Documentation](https://github.com/AdrianM756/Docker-Documentation/blob/main/Docker-Installation.md)

Once Docker is installed, We need to create a volume for our portainer to store it's database:
<br>
```
docker volume create portainer_data
```
<br>

We will then need to download and install the Portainer Server container:
<br>
```
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
```
<br>

***NOTE:*** By default, Portainer generates and uses a self-signed SSL certificate to secure port 9443. Alternatively you can provide your own SSL certificate during installation or via the Portainer UI after installation is complete.

***NOTE:*** If you require HTTP port ```9000``` open for legacy reasons, add the following to your ```docker run``` command:
<br>
```
-p 9000:9000
```
<br>

Portainer Server has now been installed. You can check to see whether the Portainer Server container has started by running ```docker ps```:
<br>
![image](https://github.com/user-attachments/assets/977c7caa-69ef-4162-9810-d547028f1e5f)
<br>

After the installation is complete, you can now access it on your browser by using:
<br>
```
https://localhost:9443
```
<br>

![image](https://github.com/user-attachments/assets/e52a1cda-c391-46de-9988-7932609ddd3e)
<br>

***NOTE:*** You can replace the ```localhost``` with the relevant IP address or FQDN if needed, and adjust the port if you changed it earlier.




