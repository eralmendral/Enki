# Changes to optimize layer-based architecture. only run npm install if there is changes in package.json

FROM node:14


WORKDIR /app


COPY package.json .


RUN npm install


COPY . .


EXPOSE 80


CMD ["node", "app.js"]

