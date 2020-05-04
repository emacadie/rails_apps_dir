class AddStartDateToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :start_date, :datetime

  end
end
