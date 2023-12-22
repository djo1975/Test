# config/initializers/elasticsearch.rb
Elasticsearch::Model.client = Elasticsearch::Client.new(host: 'localhost:9200', log: true)
