FROM node:alpine as builder

WORKDIR '/usr/app'
COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "run", "build"]
#npm run build

# the output from build is here /usr/app/build

FROM nginx

# /usr/share/nginx/html is where nginx expects static html
COPY --from=builder /usr/app/build /usr/share/nginx/html

# Start nginx automatically started by the nginx container so no special command

