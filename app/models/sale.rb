class Sale < ActiveRecord::Base
	validates :user_id, :product_id, :buyer_id, presence: :true
	# belongs_to :user
	belongs_to :product
end
