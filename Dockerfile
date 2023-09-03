FROM rust:1.67

RUN apt-get update && apt-get install gettext -y

WORKDIR /usr/src/myapp
COPY . .

ENV RPC_URL "<server-public-ip>:<rpc-port>"
ENV RPC_USER "<rpc-user>"
ENV RPC_PASSWORD "<rpc-password>"
ENV SERVER_PORT "7000"
ENV SERVER_ADDR "0.0.0.0"

RUN envsubst < ./Conf.toml.template >> /usr/src/myapp/Conf.toml

RUN cargo build

CMD ["cargo", "run"]
