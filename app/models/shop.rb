class Shop < ActiveRecord::Base
  belongs_to :shop_owner
  has_many :services
end
