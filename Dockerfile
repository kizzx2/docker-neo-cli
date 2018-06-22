FROM microsoft/dotnet:runtime

RUN apt-get update \
  && apt-get install -y libleveldb-dev sqlite3 libsqlite3-dev libunwind8-dev unzip \
  && rm -rf /var/lib/apt/lists/*

RUN latest_tag=`curl -s https://api.github.com/repos/neo-project/neo-cli/releases/latest | grep tag_name | sed -E 's/.*"([^"]+)".*/\1/'` \
  && curl -vLO https://github.com/neo-project/neo-cli/releases/download/$latest_tag/neo-cli-linux-x64.zip

RUN unzip neo-cli-linux-x64.zip && rm neo-cli-linux-x64.zip

WORKDIR /neo-cli

RUN sed -i'' 's/"Chain": .*/"Chain": "Chain",/' *.json \
  && sed -i'' 's/"ApplicationLogs": .*/"ApplicationLogs": "ApplicationLogs"/' *.json

CMD ["/usr/bin/dotnet", "neo-cli.dll", "/rpc"]
