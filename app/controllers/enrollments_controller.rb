class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:destroy]

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to student_path(@enrollment.student)
    else
      render :new
    end
  end

  def destroy
    @student = @enrollment.student
    @enrollment.destroy
    redirect_to student_path(@student)
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end
end
