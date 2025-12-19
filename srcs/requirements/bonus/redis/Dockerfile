FROM debian:bookworm

#Install redis server and utilities
RUN apt-get update && apt-get install -y \
    redis \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

#Set maximum cache memory and maximum memory eviction policy
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf

RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

#unbind ports, to allow redis to be connected to by other containers
RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

# Expose the port Redis uses INTERNALY - tells Docker that the containter listens on this port at runtime
# DOES NOT bypass Nginx
# DOES NOT publish the port to the host machine
EXPOSE 6379


CMD ["redis-server",  "--protected-mode", "no"]