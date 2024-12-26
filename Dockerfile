# -----------------------------------------------------
# Install radicale in a Synology Docker Container 
# By Hans Straßgütl 
# Development:
# 2022 01 31        Start
# 
# Read: 
#
# -----------------------------------------------------
# INSTALL
# -----------------------------------------------------
# Get yourself a very small Linux
FROM alpine:latest
USER root
# Make sure to have the latest repositories
RUN apk update
RUN apk upgrade
# Install Python and some libs
RUN apk add --no-cache python3 py3-pip py3-passlib
# Install nano editor for development purposes
# RUN apk add --no-cache nano
# Install radicale
RUN apk add --no-cache radicale
# -----------------------------------------------------
# EXECUTE
# -----------------------------------------------------
# Start & run radicale pointing to the right config file - where /etc/radicale/config is default
# Make sure to have the same path defined in your container
CMD ["radicale","--config=/etc/radicale/config"]