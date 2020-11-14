FROM cockroachdb/cockroach:v20.2.0 AS cockroach

FROM debian:buster-slim

# copy cockroach binary
COPY --from=cockroach /cockroach/cockroach /usr/bin/

RUN apt-get update && apt-get install -y \
  moreutils \
  git \
  && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
