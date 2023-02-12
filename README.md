# xlxd-docker
An attempt to run XLXD in docker container

Comiled things:

* xlxd
* ambed 
* ambedtest

ambed requires usb dongle with ambe codec, but but starts without it.

For now run 
```
./build
```

Adjust docker-compose.yml
and then run:

```
docker-compose up -d
```
