class StudentTransferService
  prepend SimpleCommand
  include ActiveModel::Validations

  def initialize(student, new_school)
    @student = student
    @new_school = new_school
  end

  def call
    current_enrollments = @student.enrollments.current_enrollments
    if current_enrollments.present?
      errors.add(:base, I18n.t('services.student_transfer.failure')) 
    else
      @student.school = @new_school
      if @student.save
        return @student
      end
    end
    nil
  end
end