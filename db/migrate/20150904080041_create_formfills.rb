class CreateFormfills < ActiveRecord::Migration
  def change
    create_table :formfills do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :address
      t.string :gender
      t.string :city
      t.string :country
      t.string :interest
      t.string :state
      t.references :formfill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
