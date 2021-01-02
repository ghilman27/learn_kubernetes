FROM node:12-alpine as build
WORKDIR /app
COPY package* yarn.lock /app/
RUN yarn install
COPY ./ /app/
RUN yarn run build

FROM nginx:stable-alpine
COPY --from=build /app/build/ /usr/share/nginx/html
EXPOSE 80