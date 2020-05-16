# Debian minimal server headless install
Patch the debian netinst iso with a preseed file to install a minimal server headlessly.

## How to use

```
./build-debian-headless.sh <debian netinst iso>
```

This will create a file in the current repository named debian-headless-netinst.iso.

## Please note:

* The created user's credentials are: ansible / changeme
* The server will only have the base packages and an openssh server.
* At the end of the installation process, the server will be shutdown.

## Useful documentation

* [Debian GNU/Linux Installation Guide](https://www.debian.org/releases/buster/amd64/index.en.html)
* [Preseed on Debian wiki](https://wiki.debian.org/DebianInstaller/Preseed)
* [Exhaustive preseed files](https://jack.einval.com/debian-preseed)
