class StudentsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
      flash[:success] = "Students created successfully."
    else
      flash[:errors] = @student.errors.full_messages
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to students_path
      flash[:success] = "Students updated successfully."
    else
      flash[:errors] = @student.errors.full_messages
      render :edit
    end
  end

  def destroy
    begin
      @student.destroy
      flash[:success] = "Student deleted successfully."
      redirect_to students_path
    rescue ActiveRecord::DeleteRestrictionError => e
      @student.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to students_url
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :age)
  end
end
