# ---------- Build Stage ----------
    FROM node:18 AS builder

    # Set working directory
    WORKDIR /app
    
    # Copy package files and install dependencies
    COPY package*.json ./
    RUN npm install
    
    # Copy rest of the app code
    COPY . .
    
    # Build the React app
    RUN npm run build
    
    
    # ---------- Serve Stage ----------
    FROM nginx:alpine
    
    # Clean existing default nginx files
    RUN rm -rf /usr/share/nginx/html/*
    
    # Copy built React app from builder
    COPY --from=builder /app/build /usr/share/nginx/html
    
    # Expose port 80
    EXPOSE 80
    
    # Start nginx
    CMD ["nginx", "-g", "daemon off;"]
    