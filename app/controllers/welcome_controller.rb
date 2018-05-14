class WelcomeController < ApplicationController
  def index
    @course_count = Course.count
    @cohort_count = Cohort.count
    @student_count = Student.count
    @instructor_count = Instructor.count
  end
end
