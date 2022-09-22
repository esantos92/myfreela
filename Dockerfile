# Extend from the official Elixir image.
FROM elixir:1.13.4


RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.7 --force && \
    mix local.rebar --force

WORKDIR /myfreela

ENV INSTALL_PATH /myfreela
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container

COPY . .

CMD ["mix", "phx.server"]