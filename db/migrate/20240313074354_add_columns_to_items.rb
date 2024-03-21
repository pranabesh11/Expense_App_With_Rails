class AddColumnsToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :date_and_time, :datetime
    add_column :items, :category, :string
    add_column :items, :payment_type, :string
    add_column :items, :income_or_expense, :string
  end
end
