# Stage 1
FROM docker.io/library/node:22 as builder
WORKDIR /app
COPY . /app
RUN npm ci && npm run build


# Stage 2
FROM docker.io/library/nginx
COPY --from=builder /app/dist/* /usr/share/nginx/html
