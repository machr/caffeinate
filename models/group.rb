class Group < ActiveRecord::Base
  has_many :shops, through: :shop_groups
end
