FROM debian:11-slim

ARG gateway_version=v1.0.0-alpha.21
ARG gateway_arch=x86_64

LABEL maintainer="vahempio@gmail.com" \
	description="Helium gateway-rs with autostart"

# cURL is also needed for the helium-gateway itself
RUN apt-get update && apt-get install -y \
	curl \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -L "https://github.com/helium/gateway-rs/releases/download/$gateway_version/helium-gateway-$gateway_version-$gateway_arch.deb" --output /tmp/helium-gateway.deb  \
    && dpkg -i /tmp/helium-gateway.deb \
    && rm /tmp/helium-gateway.deb

CMD ["helium_gateway", "-c", "/config", "server"]
