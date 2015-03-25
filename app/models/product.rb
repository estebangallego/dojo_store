class Product < ActiveRecord::Base
	validates :name, :price, :user_id, presence:true

	# has_many :sales, foreign_key: "product_id", dependent: :destroy
	# has_many :users, through: :sales, dependent: :destroy
	belongs_to :user
	has_one :sale, dependent: :destroy	
end
