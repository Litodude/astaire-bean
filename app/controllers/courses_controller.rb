class CoursesController < ApplicationController


#creating actions inside controller

def index
	@courses = Course.all
end

def new
	@course = Course.new
end

def create
	@course = Courses.new(course_params)
	if @course.save
		message = 'Your lesson has been successfully created.'
		redirect_to edit_course_url(@course.id), :fash => {:success => message}
			#commected out above need to verify if @course has a @course.id
			#nvm it does
	else
		message  = 'Please correct these errors: #{@course.errors.full)messages.join(', ')}'
		flash.now[:error] = message
		render 'courses/new'
	end
end

def update
	@course = Course.assign_attributes(course_params)
	if @course.save
		message = 'Your changes have been saved.'
		redirect_to edit_course_url(@course.id), :flash => {:success => message}
			#same as above
	else
		message = 'Please correct these errors: #{@teacher.errors.full_messages.join(', ')}'
		flash.now[:error] = message
		renger 'teachers/edit'
	end
end

def destroy
	@course = Course.destroy(params[:id])
	respond_to do |f|
		f.html { redirect_to teachers_url }
		f.json {render :json => {} }
	end
end


#need to add @teacher full_name & datetime
def course_params
	params.require(:course).permit(:full_name)
end

end
