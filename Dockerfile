FROM erlang
COPY . /opt/project
WORKDIR /opt/project
RUN rebar3 compile

ENTRYPOINT rebar3 shell

EXPOSE 8080
