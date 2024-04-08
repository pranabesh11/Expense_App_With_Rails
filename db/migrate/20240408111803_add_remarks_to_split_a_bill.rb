class AddRemarksToSplitABill < ActiveRecord::Migration[7.1]
  def change
    add_column :split_a_bills, :remarks, :string
  end
end
