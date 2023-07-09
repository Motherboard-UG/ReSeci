FROM node:16-bullseye
RUN ["npm", "i", "npm@8.19.3", "-g"]
RUN apt-get update
WORKDIR /usr/server/app

COPY ./package.json ./
RUN npm install
COPY ./ .
RUN npm run build
ENV NODE_ENV=production
ENV API_SERVER=http://localhost:8000/js/walker_run  
# replace this with your token when you log in to jaaseci terminal
ENV TOKEN=a76bf295318799e3188921ad21a19219e9ec5355c0527d2605bb542e9026482c
EXPOSE 3000
CMD ["npm","run","start","0.0.0.0:3000"] # will launch the remix app when we run this Docker image.