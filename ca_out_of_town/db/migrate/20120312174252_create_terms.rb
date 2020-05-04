class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :season
      t.integer :year

      t.timestamps
    end
  end
end
