class SalesController < ApplicationController
  def create
  	Sale.create(sale_params)
  	# Sale.create(user: User.find(session[:user_id]), product:Product.find(params[:id]))
  	# @sellerId = Product.find(params[:id]).user_id
  	# @productId = Product.find(params[:id])
  	# @buyer = User.find(session[:user_id])

  	# Sale.create(user_id: @sellerId, product_id: @productId , buyer_id: @buyer)
  	# fail
  	redirect_to request.referer
  end


  	private
	def sale_params
		params.require(:sale).permit(:user_id, :product_id, :buyer_id)
	end
end
