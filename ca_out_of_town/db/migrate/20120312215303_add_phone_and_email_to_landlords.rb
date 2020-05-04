class AddPhoneAndEmailToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :phone, :string

    add_column :landlords, :email, :string

  end
end
