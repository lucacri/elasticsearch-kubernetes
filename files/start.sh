#!/bin/sh

##################################################################################
# ensure increased ulimits - for nofile - for the Elasticsearch containers
# the limit on the number of files that a single process can have open at a time (default is 1024)
ulimit -n 65536

# ensure increased ulimits - for nproc - for the Elasticsearch containers
# the limit on the number of processes that elasticsearch can create
# 2048 is min to pass the linux checks (default is 50)
# https://www.elastic.co/guide/en/elasticsearch/reference/current/max-number-threads-check.html
ulimit -u 4096

# swapping needs to be disabled for performance and node stability
# in ElasticSearch config we are using: [bootstrap.memory_lock=true]
# this additionally requires the "memlock: true" ulimit; specifically set for each container
# -l: max locked memory 
ulimit -l unlimited

exec su elasticsearch /usr/local/bin/docker-entrypoint.sh