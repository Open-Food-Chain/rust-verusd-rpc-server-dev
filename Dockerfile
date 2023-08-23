FROM rust:1.67

RUN apt-get update && apt-get install gettext -y

WORKDIR /usr/src/myapp
COPY . .

ENV RPC_URL "localhost"
ENV RPC_USER "changeme"
ENV RPC_PASSWORD "alsochangeme"
ENV SERVER_PORT "49236"
ENV SERVER_ADDR "0.0.0.0"

RUN cargo build

RUN envsubst < ./Conf.toml.template >> /usr/src/myapp/Conf.toml

CMD ["cargo", "run"]