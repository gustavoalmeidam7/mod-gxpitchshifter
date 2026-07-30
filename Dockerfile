FROM debian:trixie-slim

RUN apt update && \
    apt install --no-install-recommends -y \
      build-essential \
      g++ \
      make \
      libarmadillo-dev \
      libfftw3-dev \
      python3-mpmath \
      lv2-dev && \
    apt clean

RUN mkdir -p /usr/local/include/lv2/lv2plug.in/ns/lv2core && \
    ln -sf /usr/include/lv2/core/lv2.h /usr/local/include/lv2/lv2plug.in/ns/lv2core/lv2.h

WORKDIR /app

CMD ["make"]
