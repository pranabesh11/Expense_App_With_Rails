class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.decimal :amount
      t.string :remarks

      t.timestamps
    end
  end
end
