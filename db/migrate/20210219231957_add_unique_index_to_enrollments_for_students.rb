class AddUniqueIndexToEnrollmentsForStudents < ActiveRecord::Migration[5.2]
  def change
    add_index :enrollments, [:student_id, :cohort_id], unique: true
  end
end
