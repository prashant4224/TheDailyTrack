module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable  
  end

  def first_comment
    b = comments.pluck(:body)
    p b
    p comments.map(&:body)
  end

  module ClassMethods

    def comment_list
      a = joins(:comments).select("comments.id, comments.body")
      p a
    end

  end

end