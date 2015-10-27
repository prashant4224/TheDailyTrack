require 'elasticsearch/model'
# require 'test_athlete'

class Ticket < ActiveRecord::Base
  # require 'benchmark'

  include TestTeam
  # include TestAthlete

  # include Searchable

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :team
  belongs_to :user
  belongs_to :objective

  #has_many :posts

  validates :title, :body, presence: true


  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :body, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'body']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            body: {}
          }
        }
      }
    )
  end
end

  # Delete the previous tickets index in Elasticsearch
Ticket.__elasticsearch__.client.indices.delete index: Ticket.index_name rescue nil
 
# Create the new index with the new mapping
Ticket.__elasticsearch__.client.indices.create \
  index: Ticket.index_name,
  body: { settings: Ticket.settings.to_hash, mappings: Ticket.mappings.to_hash }
 
# Index all ticket records from the DB to Elasticsearch
Ticket.import


