class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :password
      t.references :profileable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
