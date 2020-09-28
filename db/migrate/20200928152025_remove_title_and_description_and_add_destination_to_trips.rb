class RemoveTitleAndDescriptionAndAddDestinationToTrips < ActiveRecord::Migration[6.0]
  def change
    change_table :trips do |t|
      t.remove :title, :description
      t.string :destination
    end
  end
end
