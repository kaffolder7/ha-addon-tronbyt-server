ARG BUILD_FROM=ghcr.io/tronbyt/server:2
FROM $BUILD_FROM

# Install jq for parsing Home Assistant options.json
RUN apk add --no-cache jq bash

# Copy our startup script
COPY run.sh /
RUN chmod a+x /run.sh

# Tronbyt stores its data in /app/data
# HA apps get persistent storage at /data
# Therefore, symlink /app/data -> /data/tronbyt so it persists across restarts
CMD [ "/run.sh" ]
