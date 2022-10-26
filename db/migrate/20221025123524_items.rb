class Items < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :item_type_id
      t.string :name
      t.timestamps
    end
  end
end
