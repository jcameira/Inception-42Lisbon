FROM debian:bookworm

RUN apt-get update && apt-get install -y python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
COPY conf/ .

EXPOSE 8080
CMD ["python3", "-m", "http.server", "8080"]