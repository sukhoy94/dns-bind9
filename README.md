# DNS Server with BIND9
This repository provides a Dockerized BIND9 setup for local DNS resolution, which can be particularly useful for developers looking to simulate production DNS environments locally or for internal network purposes.


## Features:
Dockerized setup for easy deployment.
Pre-configured BIND9 for dusha-project.local.

## dusha-project.local.

dusha-project.local. is a sample domain which I'm using. The goal is to configure dns in such
way that when you entering http://dusha-project.local in browser - it should point to 
the localhost 80 port. And instead of using /etc/hosts like:

```
127.0.0.1 dusha-project.local
```

I want to achieve same results using bind9 dockerized.

## Prerequisites:
- Docker
- Docker Compose


###  Getting Started:

1. Clone the repository:

```
git clone https://github.com/sukhoy94/dns-bind9.git
```

2. Navigate to the repository folder:

```
cd dns-bind9
```

3. Build and Start the Docker container:

```
docker-compose up -d
```

4. Test the DNS resolution:

```
dig @your_container_ip dusha-project.local
```


### Configuration:
Configuration files for BIND9 are located in the bind9-config directory. You can modify these files as per your requirements:

- named.conf.local - Defines the zones.
- db.local - Contains the DNS records for the defined zone.

### Using on Host

To configure your system to use this DNS server, you'll need to add the 
DNS server's IP to the /etc/resolv.conf file on your host.

1. Open the /etc/resolv.conf file in an editor:

```
sudo nano /etc/resolv.conf
```

2. Add the IP of your Docker container at the top of the list of DNS servers:

```
nameserver your_container_ip
```

3. Save and close the file.

Now, any DNS query made from your system will first be routed to the DNS server running inside the Docker container.
Note: In some systems, the /etc/resolv.conf file might get regenerated on reboot or when network settings change. If you notice that your changes get removed, you might need additional configuration to make them persistent.

### Contributing:
Feel free to fork, improve, and submit pull requests.

### License:
This project is open-sourced software licensed under the MIT license.
