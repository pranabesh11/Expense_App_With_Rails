class CreateTinyClusters < ActiveRecord::Migration[7.1]
  def change
    create_table :tiny_clusters do |t|
      t.integer :user_id
      t.string :email
      t.string :cluster_id

      t.timestamps
    end
  end
end
