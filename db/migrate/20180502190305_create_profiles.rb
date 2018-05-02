class CreateProfiles < ActiveRecord::Migration[5.2]
  def up
    create_table :profiles do |t|
      t.string :username
      t.string :password
      t.references :profileable, polymorphic: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :profiles
  end
end
