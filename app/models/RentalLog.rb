class RentalLog < ActiveRecord::Base
    belongs_to(:item)
    belongs_to(:user)
    belongs_to(:rental_level)
end
  