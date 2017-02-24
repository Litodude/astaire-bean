class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.fine(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			message = 'Success! Your account has been created.'
		else
			message = 'Please correct these errors: #{@user.errors.full)messages.join(', ')}'
			flash.now[:error] = message
			render 'users/new'
		end
	end

	def update
		@user = User.find(paramds([:id])
		@user.assign_attributes(teacher_params)

		if @user.save
			message = 'Success! Your changes have been saved.'
			redirect to edit_user_url(@user.id), flash => {:success =>message}
		else
			message = 'Please correct these errors: #{@user.errors.full_message.join(', ')}'
			flash.now[:error] = message
			render 'users/edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |f|
			f.html { redirect_tp users_url }
			f.json { render :json => {} }
		end
	end

	private

	def user_params
		params.require(:user).permit(:full_name, :email, :birth_date, :phone_number)
	end
	
end
