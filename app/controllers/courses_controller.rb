class CoursesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def destroy
    begin
      @course = Course.find(params[:id])
      @course.destroy
      flash[:success] = "Course deleted successfully."
      redirect_to courses_path
    rescue ActiveRecord::DeleteRestrictionError => e
      @course.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to courses_url
    end
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end
end
