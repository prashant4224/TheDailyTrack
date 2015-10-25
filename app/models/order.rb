class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
  	belongs_to :user

  scope :in_progress, -> {where("orders.checked_out_at IS NULL")}
  scope :complete, -> {where("orders.checked_out_at IS NOT NULL")}

  COMPLETE = "complete"
  IN_PROGRESS = "in_progress"

  def state
  	checked_out_at.nil? ? IN_PROGRESS : COMPLETE
  end

  def self.find_with_product(product)
  	return [] unless product
  	complete.joins(:line_items).where("line_items.product_id", product.id).order("orders.checked_out_at DESC")
  end

end
