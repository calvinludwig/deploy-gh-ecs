FROM node:18.15.0 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

#-------------------------------------
FROM bitnami/node:18.15.0 as final
WORKDIR /usr/src/app

COPY package*.json ./
COPY --from=builder /usr/src/app/dist ./dist

RUN npm ci --omit=dev

ENV NODE_ENV production
EXPOSE 80

CMD ["node", "dist/server.js"]
