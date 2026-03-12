# Learning SRS - personal note

### What to do next:
- **Focus more on:**
    - How they split modules: I/O, event loop, protocol, buffer, state machine.
    - How they separate the **protocol level** (RTMP/RTC) from the **transport** (TCP/UDP).
    - How logging, error handling, configuration, and metrics are designed.

- **Use `configure` as a “catalog” of features and build modes:**
    - Take note of which features are real-time and which are just infrastructure.
    - Use the flags to build a **minimal version of SRS** (with some modules disabled) so the code is less overwhelming to read.

## All in one prebuilt standalone server

- Server will expose at localhost:8080

```bash
docker run \
    -p 1935:1935 \
    -p 1985:1985 \
    -p 8080:8080 \
    -p 8000:8000/udp \
    -p 10080:10080/udp \
    -it --rm -d \
    --name srs_aio \
    ossrs/srs:6
```

## Build the server docker image from source

- Build the server image yourself

```bash
# @ root 
docker build -t srs_aio_self_built .
```

- Run normally and the server will expose at localhost:8080

```bash
docker run --name srv_aio_self_built \
    -p 1935:1935 \
    -p 1985:1985 \
    -p 8080:8080 \
    -p 8000:8000/udp \
    -p 10080:10080/udp \
    -it --rm -d \
    srs_aio_self_built
```

## Docker Dev image ossrs/srs:ubuntu20

```bash
# @ learning
docker build -t srs_dev .
```

```bash
docker run \
    --name srs_dev \
    --shm-size=1g --privileged=true \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.ssh:/root/.ssh \
    -v $(pwd):/sources \
    -w /sources \
    --rm -it \
    srs_dev bash
```

- By this I have the developer environment, I used to map docker from host to container for development

### Streaming from another stream

- Use the learning/stream_loop.sh
```bash
./learning/stream_loop.sh &
```
- If no need log (recommended)
```bash
./learning/stream_loop.sh 1>/dev/null 2>&1 &
```