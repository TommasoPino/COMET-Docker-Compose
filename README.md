# Introduction

This is the Git repository of the official `CDP4 Community Edition` docker compose scripts. The scripts have been designed in a way that you can spin up various combinations of the CDP4 database and webservices for production,development as well as testing.

## Compatibility

**If you are going to create your own variations on these docker-compose files or create your own, bear in mind that version `4.0.0` of CDP Webservices does not support database images version higher than `1.3.1`.**

## Usage

Use the included `compose.bat` (or `compose.sh` if you are on a Linux system) script to compose the containers:

```
C:\path\to\CDP4-Docker-Compose>compose.bat [command]
```

Available commands:

### For Production

- `up` - (default if no command provided) pull the latest mutually compatible release images and runs the containers.
- `strt` - starts the containers if they already have been run and stopped.
- `stp` - stops the running containers without removing them.
- `down` - stops and removes the containers. Volume information is not lost.
- `reboot` - performs the `down` and `up` commands in sequence.
- `rebuild` - performs the `down` and `rebuild` commands in sequence.

### For Webservices Release Candidates

Runs both the latest database and the latest available [release candidate of webservices](https://github.com/RHEAGROUP/CDP4-WebServices-Community-Edition/packages/265915)

- `rc` - Spins up bare database only.
- `rcdown` - stops and removes the container. Volume information is not lost.

### For Test Database

Runs both the latest test database and the latest available version or release candidate.

- `test` - Spins up bare database and latest compatible release.
- `testdown` - stops and removes the containers. Volume information is not lost.
- `testrc` - Spins up bare database and latest release candidate.
- `testrcdown` - stops and removes the containers. Volume information is not lost.

To verify that the services are running navigate to `localhost:5000/SiteDirectory` you should be prompted for standard credentials which are `admin/pass`.

## License

The CDP4 Web Services Community Edition is licensed under the [AGPL license](LICENSE). Each docker container grants additional permission under GNU GPL version 3 section 7. See the license files in the image specific folders.
