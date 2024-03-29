class ClusterChangeGroupId < ActiveRecord::Migration[7.1]
  def change
    remove_column :clusters, :groupId, :integer
  end
end
