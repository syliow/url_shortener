class AddTitleToUrls < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :title, :string unless column_exists?(:urls, :title)
  end
end
