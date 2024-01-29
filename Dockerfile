# Use a smaller base image
FROM node:16.15.0-alpine as builder

WORKDIR /app
COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn --frozen-lockfile
COPY . .

RUN echo "$AZURE_ENV" > /app/.env


EXPOSE 3000

CMD ["node","index.js"]
