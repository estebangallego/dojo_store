class ProductsController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show]
	def index
		# @products = Product.all
		@products = Product.all.where("products.id NOT IN (?)", Sale.all.where("buyer_id = (?)", User.find(session[:user_id])).select("product_id"))
	end
	def show
		@notSold = Product.all.where("products.id NOT IN (?) AND user_id = (?)", Sale.all.where("buyer_id = (?)", User.find(session[:user_id])).select("product_id"), User.find(session[:user_id]))
				   # Product.all.where("products.id NOT IN (?) AND user_id = 3", Sale.all.where("user_id = 3").select("product_id"))
		@sales = Product.all.where("products.id IN (?) AND user_id = (?)", Sale.all.where("user_id = (?)", User.find(session[:user_id])).select("product_id"), User.find(session[:user_id]))
		@purchases = Product.all.where("products.id IN (?)", Sale.all.where("buyer_id = (?)", User.find(session[:user_id])).select("product_id"))
	end
	def create
		product = Product.new(product_params)
		if product.save
			flash[:success] = "Product successfully added!"
			redirect_to request.referer
		else
			flash[:danger] = product.errors.full_messages
			redirect_to request.referer			
		end
	end
	def destroy
		Product.find(params[:id]).destroy
		redirect_to request.referer			
	end


	private
	def product_params
		params.require(:product).permit(:name, :price, :user_id)
	end
end
