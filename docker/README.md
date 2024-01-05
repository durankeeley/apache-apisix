#docker-apache-apisix

## Setup for docker
Apache APISIX (API Gateway) uses two containers the base APISIX and etcd (configuration) with a network

First find your ```UID``` and ```GID``` by running ```id```

Make the folders you need by running ```mkdir -p ./data/etcd_data```
and setup the permissions for the folder ```sudo chown -R 1000:1000 ./data/etcd_data``` and ```sudo chmod -R 700 ./data/etcd_data```

Edit the ```docker-compose.yml``` file and replace with your ```UID``` and ```GID``` if needed

## Running the containers

to run the containers with docker just use ```docker-compose up -d```
