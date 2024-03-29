class ChangeGroupIdTypeInClusters < ActiveRecord::Migration[7.1]
  def change
    change_column :clusters, :groupId, :string
  end
end
