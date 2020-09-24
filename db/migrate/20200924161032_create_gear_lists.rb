class CreateGearLists < ActiveRecord::Migration[6.0]
  def change
    create_table :gear_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
