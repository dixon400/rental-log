class User < ActiveRecord::Base
    validates :name, presence: true
    has_many :rental_logs
end
  