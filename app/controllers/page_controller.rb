class PageController < ApplicationController
  def index
    @students_count = Student.count
    @teacher_count = Teacher.count
    @schools = School.all
  end
end
