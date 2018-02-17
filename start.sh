#!/bin/sh

# allow for memlock if enabled
# if [ "$MEMORY_LOCK" == "true" ]; then
    ulimit -l unlimited
# fi

exec su elasticsearch /usr/local/bin/docker-entrypoint.sh