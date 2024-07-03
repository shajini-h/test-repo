# define from what image we want to build from.
FROM node:16.13.2-alpine

#Create app directory
WORKDIR /usr/src/app

# for canvas
RUN apk add --no-cache \
    python3 \
    g++ \
    build-base \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    musl-dev \
    giflib-dev \
    pixman-dev \
    pangomm-dev \
    libjpeg-turbo-dev \
    freetype-dev

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# This image comes with Node.js and NPM already installed so the next thing we need to do is to install 
# your app dependencies using the npm binary. Please note that if you are using npm version 4 or earlier 
# a package-lock.json file will not be generated.
# note no need to run npm install because we copy node_moduels
#RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

COPY node_modules ./node_modules

# copy /node_modules/canvas/build/Release/canvas.node: Exec format error , because developmnet pc is window ,
# because of that remove from package.json and install on the fly and build from resource. 
RUN npm install canvas@2.10.0 --build-from-source

# Note that, rather than copying the entire working directory, we are only copying the package.json file. 
# This allows us to take advantage of cached Docker layers. bitJudo has a good explanation of this here. 
# Furthermore, the npm ci command, specified in the comments, helps provide faster, reliable, 
# reproducible builds for production environments. You can read more about this here.


# Bundle app source
COPY . .

RUN npm install pm2 -g
# Your app binds to port 8080 so you'll use the EXPOSE instruction to have it mapped by the docker daemon:

EXPOSE 7000

# define the command to run your app using CMD which defines your runtime.
# Here we will use node server.js to start your server:
CMD ["pm2-runtime","start","process_prod.yml"]
## trigger code pipeline