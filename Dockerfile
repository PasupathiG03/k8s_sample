# Use a lightweight web server
FROM nginx:alpine

# Copy all the files from the current directory to the Nginx webroot
COPY . /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# When the container starts, run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
