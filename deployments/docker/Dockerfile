FROM node 

LABEL author="tyncht"
# COPY all the files from Current Directory into the Container

COPY . /app
WORKDIR /app

# Install the Project Dependencies like Express Framework
RUN npm install

# Tell that this image is going to Open a Port 
EXPOSE 8080

# Default Command to launch the Application
CMD ["npm", "start"]
