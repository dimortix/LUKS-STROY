# Статика ЛЮКС-СТРОЙ на nginx. Render передаёт порт через $PORT —
# официальный образ nginx сам прогоняет /etc/nginx/templates/*.template
# через envsubst при старте.
FROM nginx:1.27-alpine

ENV PORT=10000

COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/nginx.conf.template \
          /usr/share/nginx/html/render.yaml \
          /usr/share/nginx/html/Dockerfile

EXPOSE 10000
