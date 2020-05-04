class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :zip
      t.integer :landlord_id

      t.timestamps
    end
  end
end
