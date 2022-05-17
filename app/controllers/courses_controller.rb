class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :update]


  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
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

  private

  def set_course
    @course = Course.find params[:id]
  end

  def course_params
    params.required(:course).permit(:title, :visible)
  end

end
