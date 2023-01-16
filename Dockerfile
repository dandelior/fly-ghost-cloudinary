FROM ghost:5.29-alpine as cloudinary
RUN apk add g++ make python3
RUN su-exec node yarn add ghost-storage-cloudinary@v2.2.5

FROM ghost:5.29-alpine
COPY --chown=node:node --from=cloudinary $GHOST_INSTALL/node_modules $GHOST_INSTALL/node_modules
COPY --chown=node:node --from=cloudinary $GHOST_INSTALL/node_modules/ghost-storage-cloudinary $GHOST_INSTALL/content/adapters/storage/ghost-storage-cloudinary
WORKDIR $GHOST_INSTALL