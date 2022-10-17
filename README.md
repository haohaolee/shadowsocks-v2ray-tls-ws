
# shadowsocks-v2ray-tls-ws

## Setting up your server
#### Open necessary ports
You need to open `443` and `80` ports on your server, make sure these ports are accessible.


#### Install Docker
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt  install docker-compose
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
- Download Shadowsocks from [releases](https://github.com/shadowsocks/shadowsocks-windows/releases) of [shadow-socks-windows](https://github.com/shadowsocks/shadowsocks-windows) repo.
- Download the latest version of [v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin) from [releases](https://github.com/shadowsocks/v2ray-plugin/releases).
- Extract `Shadowsocks-X.X.X.X.zip` file.
- Copy the `v2ray-plugin_windows_386.exe` from `v2ray-plugin-windows-386-vX.X.X` to the extracted directory of shadowsocks where `Shadowsocks.exe` is and rename it to `v2ray-plugin.exe`.
> **_NOTE:_**  Instead of copying the plugin executable where the Shadowsocks executable resides, You can add the v2ray-plugin directory to the system path environment so that Shadowsocks can find this plugin; however, you still need to rename it to `v2ray-plugin.exe`.
- Run `Shadowsocks.exe`
- Copy the `ss://` Link.
- Right click on the shadowsocks icon in system tray and hit `Servers > Import URL From Clipboard...`
- Verify and confirm the entered URL by hitting the Yes button.
- If you see `Successfully imported from ss://.......` it means you are done.
- To enable the proxy in your system, right-click on the Shadowsocks icon in the system tray and check `System Proxy > PAC`. For more information, you can take a look at [here](https://github.com/shadowsocks/shadowsocks-windows/blob/main/README.md).


