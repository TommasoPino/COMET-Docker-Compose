# Introduction

This is the Git repository of the official `CDP4 Community Edition` docker compose scripts. The scripts have been designed in a way that you can spin up various combinations of the CDP4 database and webservices for production,development as well as testing.

## Usage

Use the included `compose.bat` script to compose the containers:

```
C:\path\to\CDP4-Docker-Compose>compose.bat [command]
```

Available commands:

### For Production

- `build` - (default) pull the latest release images and runs the containers.
- `strt` - starts the containers if they already have been run and stopped.
- `stp` - stops the running containers without removing them.
- `up` - runs containers without rebuilding them.
- `down` - stops and removes the containers. Volume information is not lost.
- `reboot` - performs the `down` and `up` commands in sequence.
- `rebuild` - performs the `down` and `rebuild` commands in sequence.

### For Developers

Runs only the database, webservices should be running alongside in e.g. Visual Studio

- `dev` - Spins up database only.
- `devbg` - Same as `dev` but the container is run in background mode.
- `devdown` - stops and removes the container. Volume information is not lost.

### For Testing

Runs only the bare database, webservices should be running alongside in e.g. Visual Studio. To be used to execute [ecss-10-25-annexc-integration-tests](https://github.com/RHEAGROUP/ecss-10-25-annexc-integration-tests)

- `devtest` - Spins up bare database only.
- `devtestbg` - Same as `devtest` but the container is run in background mode.
- `devtestdown` - stops and removes the container. Volume information is not lost.

### For Webservices Release Candidates

Runs both the latest database and the latest available [release candidate of webservices](https://github.com/RHEAGROUP/CDP4-WebServices-Community-Edition/packages/265915)

- `devtest` - Spins up bare database only.
- `devtestbg` - Same as `devtest` but the container is run in background mode.
- `devtestdown` - stops and removes the container. Volume information is not lost.

To verify that the services are running navigate to `localhost:5000/SiteDirectory` you should be prompted for standard credentials which are `admin/pass`.

## License

The CDP4 Web Services Community Edition is licensed under the [AGPL license](LICENSE). Each docker container grants additional permission under GNU GPL version 3 section 7. See the license files in the image specific folders.