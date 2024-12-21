# Stage 1: Build the app
FROM node:19 AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the NestJS app
RUN npm run build

# Stage 2: Run the app
FROM node:18 AS runtime

# Set working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package*.json /app/

# Expose the ports (3000 for HTTP, 8001 for Socket.IO)
EXPOSE 3000 3001

# Run the NestJS application
CMD ["npm", "run", "start:prod"]
