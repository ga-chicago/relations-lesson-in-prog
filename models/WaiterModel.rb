class Waiter < ActiveRecord::Base
  has_many :orders
end