FROM node:20-alpine

# Install build dependencies for native modules (sharp, etc.)
RUN apk add --no-cache \
    libc6-compat \
    python3 \
    make \
    g++

WORKDIR /app

# Entrypoint script handles install + build + start
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
