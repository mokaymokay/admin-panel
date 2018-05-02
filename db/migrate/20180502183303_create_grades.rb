class CreateGrades < ActiveRecord::Migration[5.2]
  def up
    create_table :grades do |t|
      t.boolean :pass
      t.references :student, index: true
      t.references :cohort, index: true

      t.timestamps
    end
  end

  def down
    drop_table :grades
  end
end
