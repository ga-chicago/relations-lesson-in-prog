class Menuitem < ActiveRecord::Base
  has_many :orders
  has_many :waiters, :through => :orders
end