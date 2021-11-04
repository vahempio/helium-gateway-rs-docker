# Helium gateway-rs in a docker

This repository is linked to an auto-build trigger on Docker Hub available here: TBD link

With this, you can control and verify what is it included inside the image.

Thank you very much [Disk91](https://github.com/disk91/helium-gateway-rs-docker) and [Helium](https://github.com/helium/gateway-rs) for the inspiration, please visit their works.

# Initial setup

You should have a full configuration stored in `./config` on your host with this list of files:
- default.toml
- settings.toml
- gateway\_key.bin

If you are not confortable with this config, please follow the guide described by [Disk91](https://github.com/disk91/helium-gateway-rs-docker). 

## Docker run example
```
docker run \
  -e GW_LISTEN=0.0.0.0:1680 \
  -p 1680:1680/udp \
  -v ./config:/config:ro \
  vahempio/helium-gateway-rs:latest
```
Output console is readable on your stdout.

## Synology deployment example
Follow these steps:
- Add the `vahempio/helium-gateway-rs:latest` in your image list
- Select 'Launch'
- Name your container and select 'advanced settings'
- Under the tab 'Advanced settings', select the automatic reboot
- Under the tab 'Volume', add the folder with your helium config in read-only mode with a mounting point to '/config'
- Under the tab 'Port settings', add a port redirection for 1680:1680/udp
- Under the tab 'Environment', add a variable 'GW\_LISTEN' with a value '0.0.0.0:1680'
- Then, you can apply and valid all following screens
Logs are available on the `logs` tab.
