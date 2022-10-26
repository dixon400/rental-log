class RentalLevel < ActiveRecord::Base
    #self.table_name = "rental_statuses"
    validates :name, presence: true
    has_many :rental_logs
end
  