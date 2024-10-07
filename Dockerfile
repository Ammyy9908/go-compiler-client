# Stage 1: Build the React App
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Install dependencies for building the app
COPY package*.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app for production
RUN npm run build

# Stage 2: Serve the app with a static file server
FROM nginx:alpine

# Copy the build files from the previous stage to the Nginx public directory
COPY --from=build /app/dist /usr/share/nginx/html

# Copy custom nginx configuration if needed (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
