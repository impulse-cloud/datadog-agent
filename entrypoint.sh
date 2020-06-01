#!/bin/bash
set -e

# Fetch conf from git repository
./fetch_configuration.sh

# Run the container's CMD argument (which by default runs /bin/sh -c /init, but can be overridden)
# Also, it becomes PID 1 which means it responds to container signals
exec "$@"