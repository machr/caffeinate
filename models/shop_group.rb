class ShopGroup < ActiveRecord::Base
  belongs_to :shop
  belongs_to :group
end
