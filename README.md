# Plugins Static IP service

## Build

The [GitHub repository](https://github.com/emartech/plugins-static-ip-service) is linked to [Docker Hub](https://hub.docker.com/repository/docker/emarsys/plugins-static-ip-service) directly, so every push will yield a new release.

## Deploy

To deploy the latest release go to [Portainer](https://apiproxy-portainer.service.emarsys.net/) > [Stacks](https://apiproxy-portainer.service.emarsys.net/#/stacks) and select the Staging/Production instance, then change the `COMMIT_HASH` environment variable.
