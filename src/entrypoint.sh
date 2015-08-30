#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/apache-2.2/build.sh && /src/apache-2.2/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/apache-2.2/variables.sh && /src/apache-2.2/run.sh"
    ;;
esac
