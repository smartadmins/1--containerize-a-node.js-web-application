# Base Image
FROM node:22-alpine

# Create working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source
COPY . .

# Expose application port
EXPOSE 3000

# Start application
CMD ["npm", "start"]