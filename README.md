# docker-apache-2.2

A [Docker](https://docker.com/) image for [Apache HTTP Server](http://httpd.apache.org/) version 2.2.

## Run the container

Using the `docker` command:

    CONTAINER="apache-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /apache/data \
      -v /apache/ssl \
      dockerizedrupal/data:1.0.3

    CONTAINER="apache" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from apache-data \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e INDEXES="Off" \
      -e USER_ID="" \
      -e GROUP_ID="" \
      -d \
      dockerizedrupal/apache-2.2:1.0.6

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-apache-2.2.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.6 \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-apache-2.2.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.6 \
      && sudo docker build -t dockerizedrupal/apache-2.2:1.0.6 . \
      && cd -

## License

**MIT**
