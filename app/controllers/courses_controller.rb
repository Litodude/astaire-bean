class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def edit
		@course = Course.find(params[:id])
	end

	def create
		@course = Courses.new(course_params)
		if @course.save
			message = 'Your lesson has been successfully created.'
			redirect_to edit_course_url(@course.id), :fash => {:success => message}
		else
			message  = 'Please correct these errors: #{@course.errors.full)messages.join(', ')}'
			flash.now[:error] = message
			render 'courses/new'
		end
	end

	def update
		@course = Course.find(params[:id])
		@course.assign_attributes(course_params)

		if @course.save
			message = 'Your changes have been saved.'
			redirect_to edit_course_url(@course.id), :flash => {:success => message}
		else
			message = 'Please correct these errors: #{@course.errors.full_messages.join(', ')}'
			flash.now[:error] = message
			renger 'courses/edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		respond_to do |f|
			f.html { redirect_to courses_url }
			f.json { render :json => {} }
		end
	end

	private
	# add: teacher_id, duration, start_time, name
	# remove: full_name
	def course_params
		params.require(:course).permit(:full_name)
	end

end
