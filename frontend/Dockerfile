FROM node:20-alpine
WORKDIR /usr/server/app
COPY ./package.json ./
RUN npm install
COPY ./ ./

ENV NODE_ENV=development
EXPOSE 3000
CMD ["npm","run","dev"]
