class CreateSplitABills < ActiveRecord::Migration[7.1]
  def change
    create_table :split_a_bills do |t|
      t.integer :borrower
      t.decimal :amount
      t.integer :lender
      t.string :who_entered
      t.string :category
      t.string :payment_type
      t.string :group_unique_id
      t.datetime :date_and_time

      t.timestamps
    end
  end
end
