# ---------- Build Stage ----------
    FROM node:18 AS builder

    WORKDIR /app
    
    COPY package*.json ./
    RUN npm install
    COPY . .
    
    RUN npm run build
    
    # ---------- Serve Stage ----------
    FROM nginx:alpine
    
    # Remove default Nginx static assets
    RUN rm -rf /usr/share/nginx/html/*
    
    # Copy built app from builder stage
    COPY --from=builder /app/build /usr/share/nginx/html
    
    # Expose port 80 for the container
    EXPOSE 80
    
    # Start Nginx
    CMD ["nginx", "-g", "daemon off;"]
    
