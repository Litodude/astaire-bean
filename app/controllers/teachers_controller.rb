class TeachersController < ApplicationController

	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end
	
	def edit
		@teacher = Teacher.find(params[:id])
	end

	def create
		@teacher = Teacher.new(teacher_params)
		if @teacher.save
			message = 'Success! Your teacher has been saved.'
			#redirect_to edit_teacher_url(@teacher.id), :flash => {:success => message}
			redirect_to teachers_url, :flash => {:success => message}
		else
			message = 'Please correct these errors: #{@teacher.errors.full)messages.join(', ')}'
			flash.now[:error] = message
			render 'teachers/new'
		end
	end

	def update
		@teacher = Teacher.find(params[:id])
		@teacher.assign_attributes(teacher_params)

		if @teacher.save
			message = 'Success! Your changes have been saved.'
			redirect_to edit_teacher_url(@teacher.id), :flash => {:success => message}
		else
			message = 'Please correct these errors: #{@teacher.errors.full_messages.join(', ')}'
			flash.now[:error] = message
			render 'teachers/edit'
		end
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