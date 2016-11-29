# Create proxy container for nexus
#
# docker build -t proxy .

FROM nginx

MAINTAINER Vijay Praveen <vijay_sankaran@ida.gov.sg>

# Set timezone
RUN echo "Asia/Singapore" > /etc/timezone \  
 && dpkg-reconfigure -f noninteractive tzdata

# Install wget and install/updates certificates
RUN apt-get update \  
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

# Add main NGINX config
COPY nginx.conf /etc/nginx/

# Add DH params (generated with openssl dhparam -out dhparams.pem 2048)
COPY certs/dhparams.pem /etc/ssl/private/

# Add www certificates
COPY certs/wildcard-hive.crt /etc/ssl/private/  
COPY certs/wildcard-hive.key /etc/ssl/private/

# Add virtual hosts
COPY vhosts/ /etc/nginx/conf.d/

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
