class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :dish

    validates :quantity, length: {minimum:1}
    validate :validate_order

    def validate_order
        errors.add(:order_id, "order not found") unless Order.find_by(id: self.order_id)
    end
end