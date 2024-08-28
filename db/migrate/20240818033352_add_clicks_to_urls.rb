class AddClicksToUrls < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :clicks, :integer, default: 0, null: false
  end
end