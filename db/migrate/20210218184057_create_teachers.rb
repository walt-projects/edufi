class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.belongs_to :school, foreign_key: true

      t.timestamps
    end
  end
end
