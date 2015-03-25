class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:session][:email], params[:session][:password])
		if user.nil?
			flash[:danger] = "couldn't find a user with those credentials."
			
			redirect_to root_path
			
		else
			sign_in(user)
			flash[:success] = "Welcome " + user.first_name
			redirect_to products_path
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end