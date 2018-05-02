class CreateInstructors < ActiveRecord::Migration[5.2]
  def up
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :salary
      t.string :degree

      t.timestamps
    end
  end

  def down
    drop_table :instructors
  end
end
