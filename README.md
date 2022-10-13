# shadowsocks-v2ray-tls-ws

## Usage

First update the `.env` file with your Domain name and a strong password:
```bash
# it needs point to IP of this server
DOMAIN=your-domain.com

# change to your password
PASSWORD=some-strong-password

# You do not need to update the `DNS_ADDRS` and `SERVER_ADDR` but if you have a specific DNS server, you can change it.
```

`docker-compose build`

customize settings in `.env`

`docker-compose up -d`

install shadowsocks with v2ray plugin, enjoy it

