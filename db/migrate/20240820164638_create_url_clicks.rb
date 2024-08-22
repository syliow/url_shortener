class CreateUrlClicks < ActiveRecord::Migration[7.2]
  def change
    create_table :url_clicks do |t|
      t.references :url, null: false, foreign_key: true  # Ensures the foreign key is correctly set
      t.string :city                              # Stores the city or location
      t.string :region
      t.string :country
      t.datetime :clicked_at, null: false                # Stores the timestamp of the click
      t.string :ip_address                               # Stores the IP address
    end
  end
end
