class ShopOwner < ActiveRecord::Base
  has_secure_password
  has_many :shops
end
