class CreateUrlClicks < ActiveRecord::Migration[7.2]
  def change
    create_table :url_clicks do |t|
      t.references :url, foreign_key: true, null: false
      t.string :geolocation
      t.datetime :clicked_at, null: false
      t.string :ip_address
    end
  end
end
