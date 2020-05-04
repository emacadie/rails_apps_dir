class AddEndDateToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :end_date, :datetime

  end
end
