    FROM node:alpine
    WORKDIR '/app'
    COPY package.json .
    RUN npm install -g npm@7.5.3
    RUN npm install

    COPY . .
    RUN npm run build
     
    FROM nginx
    #adding expose to that AWS elastic beansstalk will expose port to external traffic
    EXPOSE 80
    COPY --from=0 /app/build /usr/share/nginx/html
