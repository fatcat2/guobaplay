FROM ubuntu:latest

# important lib things
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -yq software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -yq \
    curl g++ make autoconf automake libtool m4 libopus-dev ffmpeg  python3.8


# very important lib thing
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

ENV PATH=$PATH:/usr/local/bin/python


# rust
run apt install -yq rustc

# crusty rust
WORKDIR /workspace

COPY . /workspace

# compiled crusty rust
RUN cargo build --release
CMD ["/workspace/target/release/guobaplay-rs"]
