ARG BUILD_FROM
# hadolint ignore=DL3006
FROM $BUILD_FROM
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# ARG MDNS_REPEATER_VERSION
# RUN \
#     apk add --no-cache --virtual .build-deps \
#         build-base \
#         git \
#     \
#     && git clone -b ${MDNS_REPEATER_VERSION} --depth 1 \
#         https://github.com/pvizeli/mdns-repeater /usr/src/mdns \
#     && cd /usr/src/mdns \
#     && gcc -O3 -o /usr/bin/mdns-repeater \
#         mdns-repeater.c -DVERSION="\"${MDNS_REPEATER_VERSION}\"" \
#     \
#     && apk del .build-deps \
#     && rm -rf \
#         /usr/src/mdns
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY rootfs /