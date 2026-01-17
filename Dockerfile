# Use lightweight Nginx image
FROM nginx:alpine

# Remove default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your web app files to Nginx directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 83

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

