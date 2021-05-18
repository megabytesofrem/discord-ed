FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

ARG PORT=3000
EXPOSE 3000
CMD [ "node", "index.js" ]
