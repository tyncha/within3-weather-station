FROM node:10.15-alpine
LABEL author=”rahymov”
# COPY all the files from Current Directory into the Container
COPY . .

# Install the Project Dependencies like Express Framework
RUN npm install

# Tell that this image is going to Open a Port 
EXPOSE 3000

# Default Command to launch the Application
CMD ["npm", "start"]