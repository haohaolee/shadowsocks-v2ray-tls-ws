
# shadowsocks-v2ray-tls-ws

## Setting up your server
#### Open necessary ports
You need to open `443` and `80` ports on your server, make sure these ports are accessible.


#### Install Docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### Setup CloudFlare as your DNS server and proxy the DNS requests
There are lots of tutorials to setup your domain and server with CloudFlare DNS service, here is a good example:
https://www.youtube.com/watch?v=XQKkb84EjNQ

Make sure you have a working `A` or `AAA` record pointing to your server's IP Address.
You can choose to use CloudFlare "Proxy" or "DNS Only", either should work. "Proxy" DNS will give you a bit more security, your server's IP address won't be exposed. `CNAME` records can be omited.

![Cloudflare DNS](https://github.com/Arman92/shadowsocks-v2ray-tls-ws/blob/master/github/cloudflare-dns.png?raw=true)


## Usage

First update the `.env` file with your Domain name and a strong password:
```bash
# it needs point to IP of this server
DOMAIN=your-domain.com

# change to your password
PASSWORD=some-strong-password

# You do not need to update the `DNS_ADDRS` and `SERVER_ADDR` but if you have a specific DNS server, you can change it.
```

Then build the docker image with:
```bash
docker-compose build
```

And finially:
```bash
docker-compose up -d
```

On your clients you should install shadowsocks with v2ray plugin
### Android

 - [Shadowsocks](https://play.google.com/store/apps/details?id=com.github.shadowsocks&hl=en_GB&gl=US)
 - [Shadowsocks V2Ray Plugin](https://play.google.com/store/apps/details?id=com.github.shadowsocks.plugin.v2ray&hl=en_GB&gl=US) (This is only a plugin and not a runnable application. you'll need this in the main Shadowsocks application)

Here's an example configuration with the default password and domain in `.env` file:
```
ss://YWVzLTI1Ni1nY206c29tZS1zdHJvbmctcGFzc3dvcmQ@domain.com:443?plugin=v2ray-plugin%3Bpath%3D%2Fv2ray%3Bhost%3Ddomain.com%3Btls
```
### Windows
Documentation needed!



