class Item < ActiveRecord::Base
    validates :name, presence: true
    has_many :rental_logs, class_name: "RentalLog",
                            foreign_key: "item_id"
    belongs_to(:item_type)
end