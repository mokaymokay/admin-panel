class CreateCohorts < ActiveRecord::Migration[5.2]
  def up
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :course, index: true
      t.references :instructor, index: true

      t.timestamps
    end
  end

  def down
    drop_table :cohorts
  end
end
