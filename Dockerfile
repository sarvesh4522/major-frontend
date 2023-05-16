FROM node:10.19-alpine

WORKDIR /app-client

COPY package.json ./package.json

RUN rm -rf node_modules

RUN npm install 

RUN npm install react-scripts -g

COPY . .

EXPOSE 3000

RUN export NODE_OPTIONS=--openssl-legacy-provider

CMD ["npm","run", "start"]

# # => Run container
# FROM nginx:1.16.0

# COPY --from=build /app-client/build /usr/share/nginx/html

# RUN rm /etc/nginx/conf.d/default.conf

# COPY /usr/share/nginx/nginx.conf /etc/nginx/conf.d

# EXPOSE 80

# # Start Nginx server
# CMD ["/bin/bash", "-c", "nginx -g \"daemon off;\""]
