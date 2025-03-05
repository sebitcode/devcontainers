ARG RUST_VERSION=1.85.0
ARG ALPINE_VERSION=3.21

# First stage: Rust base image
FROM rust:${RUST_VERSION}-alpine${ALPINE_VERSION}
RUN apk add git