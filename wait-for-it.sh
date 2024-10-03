#!/usr/bin/env bash
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"

until nc -z "$host" 5140; do
  >&2 echo "Graylog is unavailable - sleeping"
  sleep 1
done

>&2 echo "Graylog is up - executing command"
exec $cmd