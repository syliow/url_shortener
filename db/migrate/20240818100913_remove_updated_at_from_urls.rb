class RemoveUpdatedAtFromUrls < ActiveRecord::Migration[7.2]
  def change
    remove_column :urls, :updated_at, :datetime
  end
end
