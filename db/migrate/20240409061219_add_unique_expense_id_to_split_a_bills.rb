class AddUniqueExpenseIdToSplitABills < ActiveRecord::Migration[7.1]
  def change
    add_column :split_a_bills, :unique_expense_id, :string, null: false
  end
end
