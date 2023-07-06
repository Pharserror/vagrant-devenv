export ES_JAVA_OPTS=-Xmx256m -Xms256m
export cluster-name=docker-cluster
export discovery.type=single-node
export network.host=0.0.0.0

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.8.tar.gz
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.8.tar.gz.sha512
shasum -a 512 -c elasticsearch-6.8.8.tar.gz.sha512
tar -xzf https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.8.tar.gz
# cd elasticsearch-8.5.0/
