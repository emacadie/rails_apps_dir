class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :first_name
      t.string :second_name
      t.text :note

      t.timestamps
    end
  end
end
