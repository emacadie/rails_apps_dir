class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :review
      t.integer :user_id

      t.timestamps
    end
  end
end
