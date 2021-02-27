This is a wrapper for the awesome LGSM server, which does not seem to handle
running two instances and then updating both well.

To build: `docker build -t <tag> .`

To run:

```
# Make a volume to mount in
mkdir /home/ubuntu/server1


docker run --name valheim-server -d --network host kylep/valheim-server

# hop into the container
docker exec -it valheim-server bash

# install the server
./vhserver install

# Start the server
./vhserver start

# Stop the server
./vhserver stop

# hop out of the container
exit
```

Now you might want to copy in a config file or a world backup.

Maybe a docker volume would be better for this, just worried about permissions. Haven't
tried it but it'd help in not losing your save.

```
# copy in the world
docker cp worlds/ valheim-server:/home/vhserver/.config/unity3d/IronGate/Valheim/
# copy in the config
docker cp vhserver.cfg valheim-server:/home/vhserver/lgsm/config-lgsm/vhserver/vhserver.cfg
```

Then update the server and your save to the latest version
```
docker exec -it valheim-server bash
./vhserver update
```

Now from inside the container, run the server. `start` runs it in the background
but `debug` runs it in the foreground which is nice for `docker logs`, but I haven't
gotten debug to work quite right.

```
./vhserver start
```
