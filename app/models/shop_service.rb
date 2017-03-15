class ShopService < ActiveRecord::Base
  belongs_to :service
  belongs_to :shop
end
