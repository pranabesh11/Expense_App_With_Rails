class AddGroupIduuidToClusters < ActiveRecord::Migration[7.1]
  def change
    add_column :clusters, :groupIduuid, :string
  end
end
