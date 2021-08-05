class CreateCurriculums < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculums do |t|
      t.string :title, null: false
      t.text :description
      t.integer :capacity

      t.timestamps
    end
  end
end
