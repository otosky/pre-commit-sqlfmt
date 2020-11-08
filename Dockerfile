FROM cockroachdb/cockroach

RUN apt-get update && apt-get install -y \
  moreutils \
  git \
  && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
