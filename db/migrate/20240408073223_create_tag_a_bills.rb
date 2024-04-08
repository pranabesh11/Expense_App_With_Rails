class CreateTagABills < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_a_bills do |t|
      t.integer :lender
      t.integer :borrower
      t.decimal :amount
      t.string :category
      t.string :payment_type
      t.string :group_unique_id
      t.datetime :date_and_time

      t.timestamps
    end
  end
end
