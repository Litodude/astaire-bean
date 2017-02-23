class TeachersController < ApplicationController

	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(teacher_params)
		if @teacher.save
			message = 'Success! Your teacher has been saved.'
			redirect_to edit_teacher_url(@teacher.id), :flash => {:success => message}
		else
			message = 'Please correct these errors: #{@teacher.errors.full)messages.join(', ')}'
			flash.now[:error] = message
			render 'teachers/new'
		end
	end

	def edit
		@teacher = Teacher.find(params[:id])
	end
<<<<<<< HEAD
end

def edit
	@teacher = Teacher.find(params[:id])
end

def update
	@teacher = Teacher.find(params[:id])
	@teacher.assign_attributes(teacher_params)
	
	if @teacher.save
		message = 'Success! Your changes has been saved.'
		redirect_to edit_teacher_url(@teacher.id), :flash => {:success => message}
	else
		message = 'Please correct these errors: #{@teacher.errors.full_messages.join(', ')}'
		flash.now[:error] = message
		render 'teachers/edit'
=======

	def update
		@teacher = Teacher.find(params[:id])
		@teacher.assign_attributes(teacher_params)

		if @teacher.save
			message = 'Success! Your changes has been saved.'
			redirect_to edit_teach_url(@teacher.id), :flash => {:success => message}
		else
			message = 'Please correct these errors: #{@teacher.errors.full_messages.join(', ')}'
			flash.now[:error] = message
			render 'teachers/edit'
		end
>>>>>>> 0c4a356399e02e4af1ef1a25ed0b673079fbb99c
	end

	def destroy
		@teacher = Teacher.find(params[:id])
		@teacher.destroy

		respond_to do |f|
			f.html { redirect_to teachers_url }
			f.json { render :json => {} }
		end
	end

	private

	def teacher_params
		params.require(:teacher).permit(:full_name)
	end

end