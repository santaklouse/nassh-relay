FROM node:10

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8022

CMD [ "node", "nassh-relay.js", "8022" ]
