FROM node:8-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8022

#COPY .env.example ./.env

CMD [ "node", "nassh-relay.js", "8022" ]
