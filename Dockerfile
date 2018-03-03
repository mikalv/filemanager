# Docker context should be "<repo-root>"

FROM node:8-alpine
LABEL maintainer="kirill.volkovich@opuscapita.com"

ENV PORT 80
ENV HOST 0.0.0.0
ENV NODE_ENV "production"
ENV OPUSCAPITA_FILEMANAGER_FS_ROOT "/var/app-data"
ENV OPUSCAPITA_FILEMANAGER_READONLY "true"

WORKDIR /app

COPY ./packages/server-nodejs /app

RUN cd /app && npm install && \
    mkdir /var/app-data

VOLUME /var/app-data

EXPOSE 80

CMD ["npm", "start"]
