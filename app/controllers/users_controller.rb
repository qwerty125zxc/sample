class UsersController < ApplicationController #crud jopta
	def new
		@user = User.new #звертання до моделі User
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		end
	end

	def login
		@user = User.new
	end

	def result		
		@user = User.find_by(email: params[:user][:email],password: params[:user][:password])
		redirect_to user_path(@user.id)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user.save
			redirect_to user_path(@user.id)
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy		
		redirect_to root_path		
	end

	private
	def user_params
		params.require(:user).permit(:lastname, :firstname, :email, :password)
	end
end
