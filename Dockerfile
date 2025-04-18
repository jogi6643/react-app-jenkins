# ---------- Build Stage ----------
    FROM node:18 AS builder

    WORKDIR /app
    
    # Copy only package files first for better caching
    COPY package*.json ./
    RUN npm install
    
    # Copy the rest of the app source code
    COPY . .
    
    # Build the React app for production
    RUN npm run build
    
    # ---------- Serve Stage ----------
    FROM nginx:alpine
    
    # Remove the default Nginx static assets
    RUN rm -rf /usr/share/nginx/html/*
    
    # Copy built React app from the builder stage
    COPY --from=builder /app/build /usr/share/nginx/html
    
    # Expose port 80 (already mapped to 3000 in docker-compose)
    EXPOSE 80
    
    # Start Nginx in foreground
    CMD ["nginx", "-g", "daemon off;"]
    