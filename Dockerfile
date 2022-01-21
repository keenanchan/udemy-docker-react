# 1. BUILD PHASE
FROM node:16-alpine as builder

# specify that node user will be executing instructions
USER node

# use /home/node/app, otherwise WORKDIR creates a root-owned workdir
# this would cause permissions issues
RUN mkdir -p /home/node/app
WORKDIR /home/node/app

# chown is to set ownership to node
COPY --chown=node:node ./package.json ./
RUN npm install

COPY --chown=node:node ./ ./

# build production artifacts
RUN npm run build


# 2. RUN PHASE
FROM nginx

# locally this does nothing, but this is for EB to realise
# which port to expose!
EXPOSE 80

COPY --from=builder /home/node/app/build /usr/share/nginx/html

# default command of nginx already starts the server up
