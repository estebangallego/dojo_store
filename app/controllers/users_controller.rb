class UsersController < ApplicationController

	def index
		redirect_to root_path
	end

	def new
		redirect_to root_path
	end

	def edit
		redirect_to root_path
	end

	def show
		redirect_to root_path
	end

	def create
		@user = User.new(user_params)

		if @user.save
			sign_in(@user)
			flash[:success] = "Welcome " + @user.first_name
			redirect_to products_path
		else
			flash[:danger] = @user.errors.full_messages
			redirect_to root_path
		end
		# redirect_to request.referer
	end

	def update
		redirect_to root_path
	end

	def destroy
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
