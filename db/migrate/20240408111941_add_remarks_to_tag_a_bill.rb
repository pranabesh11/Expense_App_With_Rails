class AddRemarksToTagABill < ActiveRecord::Migration[7.1]
  def change
    add_column :tag_a_bills, :remarks, :string
  end
end
