FROM node:latest

# Caches node_modules to speed up build time
ADD package.json /tmp/package.json
RUN cd /tmp && yarn install --production
RUN mkdir -p /server && cp -r /tmp/* /server/

# Create the working directory and copy in the bundle
ADD ./src /server/src
WORKDIR /server

# Expose the port and run it
EXPOSE 3000
ENTRYPOINT ["npm", "start"]