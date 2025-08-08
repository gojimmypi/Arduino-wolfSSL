

Assumptions:

```
PUBLISH_VERSION="v5.7.4"
WOLFSSL_ROOT="/mnt/c/workspace/wolfssl-master"
ARDUINO_ROOT="/mnt/c/workspace/Arduino-wolfSSL-$USER"
PUBLISH_TAG="$PUBLISH_VERSION-stable"
```

# Setup wolfSSL directory with desired release

```bash
cd "$WOLFSSL_ROOT"
git fetch
git pull
git tag
git checkout "$PUBLISH_TAG"
git status
```


```bash
git checkout main
git fetch
git pull
git fetch upstream main
git pull upstream main

git git branch "Arduino-%PUBLISH_VERSION%"

cd "$WOLFSSL_ROOT/IDE/ARDUINO"
./wolfssl-arduino.sh INSTALL "$ARDUINO_ROOT"

```
