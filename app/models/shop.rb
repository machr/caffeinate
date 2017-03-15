class Shop < ActiveRecord::Base
  belongs_to :shop_owner
  has_many :shop_services
  has_many :services, through: :shop_services
end
