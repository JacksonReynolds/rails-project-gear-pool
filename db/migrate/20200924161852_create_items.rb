class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :condition
      t.integer :gear_list_id

      t.timestamps
    end
  end
end
