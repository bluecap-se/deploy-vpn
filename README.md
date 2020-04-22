# Deploy VPN

![Status](https://img.shields.io/badge/status-stable-brightgreen.svg)
![PyPI - Python Version](https://img.shields.io/badge/python-3.7-blue.svg)
![Platform](https://img.shields.io/badge/platform-win%20%7C%20lin%20%7C%20osx-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

Deploys a VPN server on DigitalOcean in less than 2 minutes.

## Usage

### First time

1. Install dependencies with:

```
$ pipenv install && pipenv shell
```

2. Generate a new API Token in [DigitalOcean](https://www.digitalocean.com/) and add it to the [vault](https://github.com/bluecap-se/deploy-vpn/blob/master/inventory/production/group_vars/all/secret/do.yml) as seen below and encrypt the vault.

```
---
do_secret_token: XXX
```

```
$ ansible-vault encrypt inventory/production/group_vars/secret/do.yml
```

### Launch

Create the service with:

```
$ ./up.sh
```

Now there should be a file named client.ovpn in the same folder. Add this to your VPN client.

### Remove

Remove the service with:

```
$ ./down.sh
```

## License

Published under [MIT License](https://github.com/bluecap-se/deploy-vpn/blob/master/LICENSE).
