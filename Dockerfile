FROM mcr.microsoft.com/dotnet/core/sdk:3.1-bionic

# install all pre-requisites, these will be needed always
RUN apt-get update && apt-get install -y \
      openssl \
      libopus-dev \
      opus-tools \
      ffmpeg \
      git

# download and install the TS3AudioBot in the specified version and flavour
RUN mkdir -p /opt/ \
    && cd /opt \
    && git clone --recurse-submodules --single-branch --branch develop https://github.com/Splamy/TS3AudioBot.git \
    && cd TS3AudioBot \
    && dotnet build --framework netcoreapp3.1 --configuration Develop TS3AudioBot

# make data directory and chown it to the ts3bot user
RUN mkdir -p /data

# set the work dir to data, so users can properly mount their config files to this dir with -v /host/path/to/data:/data
WORKDIR /data

CMD ["dotnet", "/opt/TS3AudioBot/TS3AudioBot/bin/Develop/netcoreapp3.1/TS3AudioBot.dll", "--non-interactive"]
