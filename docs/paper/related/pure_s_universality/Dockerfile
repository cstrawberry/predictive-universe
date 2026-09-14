FROM ubuntu:noble-20260810@sha256:33ceb71981b602c1a7443a53469e4dba065f7503eab3078a2d7a57a2ab987517 AS certificate-bootstrap

# The base has no trust store. Authenticate this exact certificate archive
# with Ubuntu's archive key and its content hash before using the HTTPS snapshot.
RUN apt-get update --error-on=any \
    && cd /tmp \
    && apt-get download ca-certificates=20260601~24.04.1 \
    && echo '6bac2a01979e210d9eac1d4d56747ec709ea60654744d66705dc3c36e7629e50  ca-certificates_20260601~24.04.1_all.deb' | sha256sum --check --strict \
    && dpkg-deb --extract ca-certificates_20260601~24.04.1_all.deb /certificates \
    && cat /certificates/usr/share/ca-certificates/mozilla/*.crt > /ca-certificates.crt

FROM ubuntu:noble-20260810@sha256:33ceb71981b602c1a7443a53469e4dba065f7503eab3078a2d7a57a2ab987517

ARG UBUNTU_SNAPSHOT=20260824T000000Z
ARG LEAN_TOOLCHAIN=leanprover/lean4:v4.33.1
ARG LEAN4LEAN_COMMIT=8223d223ed98661882e95d9d6a7126df7097cd76
ARG BATTERIES_COMMIT=76e1c118b0700b4ceafe99532e887d6431625e1a
ARG PYTHON_SOURCE_URL=https://www.python.org/ftp/python/3.12.13/Python-3.12.13.tgz
ARG PYTHON_SOURCE_SHA256=0816c4761c97ecdb3f50a3924de0a93fd78cb63ee8e6c04201ddfaedca500b0b
ARG VCS_REF
ARG REPOSITORY_URL

LABEL org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.source="${REPOSITORY_URL}"

ENV DEBIAN_FRONTEND=noninteractive \
    ELAN_HOME=/opt/elan \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LEAN4LEAN_SOURCE=/opt/checker-sources/lean4lean \
    PATH=/opt/cpython/bin:/opt/elan/bin:${PATH} \
    PURE_S_CANONICAL_CONTAINER=1 \
    PYTHONHASHSEED=0 \
    PYTHONDONTWRITEBYTECODE=1 \
    SOURCE_DATE_EPOCH=1789257600 \
    TZ=UTC

COPY --from=certificate-bootstrap /ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

RUN apt-get update --error-on=any --snapshot ${UBUNTU_SNAPSHOT} \
    && apt-get install -y --no-install-recommends --snapshot ${UBUNTU_SNAPSHOT} \
       ca-certificates \
       build-essential \
       curl \
       elan \
       git \
       libbz2-dev \
       libffi-dev \
       liblzma-dev \
       libreadline-dev \
       libsqlite3-dev \
       libssl-dev \
       fonts-lmodern=2.005-1 \
       lmodern=2.005-1 \
       make \
       pandoc \
       python3 \
       python3-pip \
       texlive-base=2023.20240207-1 \
       texlive-binaries=2023.20230311.66589-9build3 \
       texlive-fonts-recommended=2023.20240207-1 \
       texlive-latex-base=2023.20240207-1 \
       texlive-latex-recommended=2023.20240207-1 \
       uuid-dev \
       zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN test -n "${VCS_REF}" && test -n "${REPOSITORY_URL}" \
    && curl --fail --location --proto '=https' --tlsv1.2 \
       "${PYTHON_SOURCE_URL}" --output /tmp/Python.tgz \
    && echo "${PYTHON_SOURCE_SHA256}  /tmp/Python.tgz" | sha256sum --check --strict \
    && mkdir /tmp/Python \
    && tar --extract --gzip --file /tmp/Python.tgz --directory /tmp/Python --strip-components=1 \
    && cd /tmp/Python \
    && ./configure --prefix=/opt/cpython --with-ensurepip=install \
    && make -j2 \
    && make install \
    && /opt/cpython/bin/python3 --version \
    && test "$(/opt/cpython/bin/python3 -c 'import platform; print(platform.python_version())')" = 3.12.13 \
    && rm -rf /tmp/Python /tmp/Python.tgz

RUN elan toolchain install ${LEAN_TOOLCHAIN} \
    && elan default ${LEAN_TOOLCHAIN} \
    && lean --version \
    && lake --version

# LocalWorkspace redirects ELAN_HOME into disposable storage. Invoke the
# installed toolchain directly so the verifier never depends on elan proxies.
ENV PATH=/opt/elan/toolchains/leanprover--lean4---v4.33.1/bin:${PATH}

RUN mkdir -p /opt/checker-sources

RUN git clone https://github.com/digama0/lean4lean.git /opt/checker-sources/lean4lean \
    && git -C /opt/checker-sources/lean4lean checkout --detach ${LEAN4LEAN_COMMIT} \
    && test "$(git -C /opt/checker-sources/lean4lean rev-parse HEAD)" = "${LEAN4LEAN_COMMIT}" \
    && test "$(git -C /opt/checker-sources/lean4lean rev-parse 'HEAD^{tree}')" = 0b3bc47e6ea1e878e49b45604f3e622de691ec9a \
    && mkdir -p /opt/checker-sources/lean4lean/.lake/packages \
    && git clone https://github.com/leanprover-community/batteries.git /opt/checker-sources/lean4lean/.lake/packages/batteries \
    && git -C /opt/checker-sources/lean4lean/.lake/packages/batteries checkout --detach ${BATTERIES_COMMIT} \
    && test "$(git -C /opt/checker-sources/lean4lean/.lake/packages/batteries rev-parse HEAD)" = "${BATTERIES_COMMIT}" \
    && test "$(git -C /opt/checker-sources/lean4lean/.lake/packages/batteries rev-parse 'HEAD^{tree}')" = 9d0aee6b2d05b2bb599f5e0c35617ef602f2e6c5

WORKDIR /opt/pure-s
COPY requirements.txt ./
RUN python3 -m pip install --require-hashes --no-cache-dir -r requirements.txt

COPY . ./
RUN groupadd --gid 10001 verifier \
    && useradd --create-home --uid 10001 --gid 10001 verifier \
    && chown -R verifier:verifier /opt/pure-s /opt/checker-sources \
    && install -d -o verifier -g verifier -m 0700 /opt/pure-s/.work

VOLUME ["/opt/pure-s/.work"]
USER verifier
CMD ["python3", "-B", "src/run_current_verification.py", "--lake", "/opt/elan/toolchains/leanprover--lean4---v4.33.1/bin/lake", "--lean4lean-source", "/opt/checker-sources/lean4lean", "--work-dir", "/opt/pure-s/.work/reproduction", "--stage", "all"]
