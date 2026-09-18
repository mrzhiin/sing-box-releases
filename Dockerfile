FROM gcr.io/distroless/cc-debian13:latest
ARG TARGETARCH
COPY ${TARGETARCH}/sing-box /usr/local/bin/sing-box
COPY ${TARGETARCH}/LICENSE /usr/share/licenses/sing-box/LICENSE
# Smoke-test both architectures before publishing the manifest.
RUN ["/usr/local/bin/sing-box", "version"]
ENTRYPOINT ["/usr/local/bin/sing-box"]
CMD ["run", "-c", "/etc/sing-box/config.json"]
