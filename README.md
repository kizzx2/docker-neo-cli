# neo-cli

Docker image to easily run NEO-CLI client. This is also the easiest method to run NEO-CLI as a daemon as of writing.

## Usage

Start syncing with RPC:

```bash
docker run --rm -it -p 10332:10332 -v $PWD/Chain:/neo-cli/Chain kizzx2/neo-cli
```

Start syncing with RPC on testnet:

```bash
docker run --rm -it -v $PWD/Chain:/neo-cli/Chain -p 20332:20332 kizzx2/neo-cli \
  bash -c 'cp config.testnet.json config.json && dotnet neo-cli /rpc'
```

Starting as a daemon:

```bash
docker run --name neo-cli -id --rm -p 10332:10332 kizzx2/neo-cli
```

Starting as a daemon with `docker-compose`:

Use the `docker-compose.yml`
