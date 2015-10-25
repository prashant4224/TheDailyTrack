class Shipping < ActiveRecord::Base
  belongs_to :payment
end
