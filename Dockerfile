ARG BUILDER_VERSION
FROM odaceo/builder:${BUILDER_VERSION}

LABEL vendor="Odaceo" 
LABEL maintainer="Alexandre GARINO <alexandre.garino@odaceo.ch>"

ARG LLVM_VERSION
ENV CC clang 
ENV CXX clang++
COPY scripts/clang.sh /root/
RUN set -eux; /root/clang.sh
