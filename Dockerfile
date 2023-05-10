FROM node:14

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        sudo \
        curl \
        git \
        lv \
        vim \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt/; \
    curl https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-20/wasi-sdk-20.0-linux.tar.gz -L | tar zx
ENV PATH /opt/wasi-sdk-20.0/bin:$PATH

WORKDIR /root
RUN git clone https://github.com/tatatakky/wath.git && \
    cd wath && \
    make
COPY . /root
RUN npm i
RUN mv ./wath/wath.wasm ./public/wasm/

CMD ["node", "src/index.js"]
