FROM ubuntu:20.04 AS build
WORKDIR /App

# Set variables to configure timezone non-interactively
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y curl zlib1g-dev build-essential libicu-dev tzdata

RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -c 8.0

COPY *.cs ./
COPY *.csproj ./
ARG TARGET_VERSION
RUN ~/.dotnet/dotnet publish -r linux-x64 --configuration Release -p:Version=$TARGET_VERSION --self-contained=true -p:PublishAot=true -p:StripSymbols=true -o build

FROM scratch as output
COPY --from=build /App/build/VmChamp /VmChamp

FROM build as release
COPY --from=build /App/build/VmChamp /VmChamp

