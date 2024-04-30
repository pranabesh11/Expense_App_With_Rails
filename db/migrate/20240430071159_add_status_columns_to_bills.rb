class AddStatusColumnsToBills < ActiveRecord::Migration[7.1]
  def change
    add_column :split_a_bills, :payment_status, :string
    add_column :split_a_bills, :delete_status, :string

    add_column :tag_a_bills, :payment_status, :string
    add_column :tag_a_bills, :delete_status, :string
  end
end
