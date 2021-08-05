class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name, null: false
      t.belongs_to :school, null: false, foreign_key: true
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :curriculum, foreign_key: true

      t.timestamps
    end
  end
end
