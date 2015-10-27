class Post
	include Cequel::Record
  #belongs_to :postable, polymorphic: true
	#belongs_to :user
	#belongs_to :objective #, counter_cache: true

  key :id, :timeuuid, auto: true
  column :title, :text
  column :user_id, :uuid, :index => true
  # column :postable_type, :text
  # column :postable_id, :uuid
  # column :objective_id, :uuid, :index => true

	#has_many :comments, as: :commentable
	#has_many :comments, dependent: :destroy
end
