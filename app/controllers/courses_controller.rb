class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]


  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    redirect_to courses_path
  end

  def update
    @course.update course_params
    redirect_to courses_path
  end

  def edit
  end

  def destroy
    @course.delete
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

  def course_params
    params.required(:course).permit(:title, :description, :published, :visible)
  end

end
