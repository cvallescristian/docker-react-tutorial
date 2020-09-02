FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build


FROM nginx
#copy from the builder face , <local-folder> <container-destiny>
COPY --from=builder  /app/build /usr/share/nginx/html
