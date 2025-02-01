# Use the official MySQL image
FROM mysql:8.0

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=training_management

# Copy the initialization script into the container
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306
