class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.datetime :pickup
      t.datetime :drop_off
      t.integer :user_id
      t.integer :gear_list_id

      t.timestamps
    end
  end
end
