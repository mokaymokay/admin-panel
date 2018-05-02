class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.boolean :pass
      t.integer :student_id
      t.integer :cohort_id

      t.timestamps
    end
    add_index :grades, :student_id
    add_index :grades, :cohort_id
  end
end
