# -*- mode: dockerfile -*-
#
# An example Dockerfile showing how to build a Rust executable using this
# image, and deploy it with a tiny Alpine Linux container.

# You can override this `--build-arg BASE_IMAGE=...` to use different
# version of Rust or OpenSSL.
#ARG BASE_IMAGE=ekidd/rust-musl-builder:latest

# Our first FROM statement declares the build environment.
#FROM ${BASE_IMAGE} AS builder

# Add our source code.
FROM ubuntu:18.04
 
RUN apt-get update && apt-get install -y curl
RUN apt-get install build-essential -y
 
RUN mkdir -p /user/turreta-rust-builder/src
WORKDIR /user/turreta-rust-builder/src
 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

#ADD --chown=rust:rust . ./
RUN apt-get update -y
RUN apt-get install build-essential autoconf automake libtool m4 -y
RUN apt-get install libopus-dev -y 
RUN apt-get install ffmpeg -y 
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

# Build our application.
#RUN cargo build --release

# Now, we need to build our _real_ Docker container, copying in `using-diesel`.
#FROM alpine:latest
#RUN apk --no-cache add ca-certificates
#RUN apt update
#RUN apt install build-essential autoconf automake libtool m4 -y
#RUN apt install libopus-dev -y 
#RUN apt install ffmpeg -y 
#RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
#RUN chmod a+rx /usr/local/bin/youtube-dl


#COPY --from=builder \
#COPY /home/rust/src/target/x86_64-unknown-linux-musl/release/guoboro-rs \
 #   /usr/local/bin/
#CMD /usr/local/bin/guoboro-rs
