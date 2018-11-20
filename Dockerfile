FROM node:alpine as builder

WORKDIR  '/app'

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "start"]

FROM nginx

EXPOSE 808

COPY --from=builder /app/build /usr/share/nginx/html
