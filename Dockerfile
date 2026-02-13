# Use the database-specific base image
# FROM ghcr.io/berriai/litellm-database:main-stable
FROM ghcr.io/berriai/litellm-database:main-v1.81.9.rc.1

# Set the working directory to /app
WORKDIR /app

# Install the missing a2a-sdk dependency required by the A2A endpoint
RUN pip install --no-cache-dir a2a-sdk

# Copy the configuration file into the container at /app
COPY litellm_config.yaml .

# Expose the necessary port
EXPOSE 4000/tcp

# The command to run litellm. This is now part of the base image. 
CMD ["--port", "4000", "--config", "litellm_config.yaml"]
