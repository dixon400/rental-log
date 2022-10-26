class RentalLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :rental_logs do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :rental_level_id
      t.timestamps
    end
  end
end
