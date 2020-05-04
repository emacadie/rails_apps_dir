class CreateWpOptions < ActiveRecord::Migration
  def change
    create_table :wp_options do |t|
      t.integer :option_id
      t.string :option_name
      t.text :option_value
      t.string :autoload

      t.timestamps
    end
  end
end
