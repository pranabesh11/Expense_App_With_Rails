class CreateClusters < ActiveRecord::Migration[7.1]
  def change
    create_table :clusters do |t|
      t.integer :groupId
      t.string :groupname
      t.integer :userId

      t.timestamps
    end
  end
end
