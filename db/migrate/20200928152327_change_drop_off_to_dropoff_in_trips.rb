class ChangeDropOffToDropoffInTrips < ActiveRecord::Migration[6.0]
  def change
    change_table :trips do |t|
      t.remove :drop_off
      t.datetime :dropoff
    end
  end
end
