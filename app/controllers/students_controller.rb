class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :show, :destroy]
  def index
    @students = Student.order(:name)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_paramms)
    if @student.save
      redirect_to students_path
      flash[:success] = "Students created successfully."
    else
      flash[:errors] = @student.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @student.update(student_paramms)
      redirect_to student_path(@student)
      flash[:success] = "Student updated successfully."
    else
      flash[:errors] = @student.errors.full_messages
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private
  def student_paramms
    params.require(:student).permit(:name, :age)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
