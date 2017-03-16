class Service < ActiveRecord::Base
  has_many :shops, through: :shop_services
end
