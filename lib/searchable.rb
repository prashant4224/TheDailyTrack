module Searchable
# 	extend ActiveSupport::Concern

# 	included do
# 		include Elasticsearch::Model
# 		include Elasticsearch::Model::Callbacks

# 		include Indexing
# 		after_touch() { __elasticsearch__.index_document }
# 	end

# 	module Indexing

# 		def as_indexed_json(options={})
# 			self.as_json(
# 				include: { plans: { only: :name}
# 							})
# 		end
# 	end
end