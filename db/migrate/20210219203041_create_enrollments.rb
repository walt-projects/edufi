class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.string :school_id, null: false
      t.integer :student_id, null: false
      t.integer :cohort_id, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
