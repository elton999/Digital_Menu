class Order < ApplicationRecord
    has_many :order_items
    belogns_to :user
    has_one :table
end
