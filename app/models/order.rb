class Order < ApplicationRecord
    has_many :order_items
    belongs_to :user
    has_one :table

    scope :with_table, -> (table_id) { find_by(table_id: table_id)}
    scope :with_user, ->(user_id){ find_by(user_id: user_id) }
    scope :opened, -> (user_id, table_id){ find_by(user_id: user_id, table_id: table_id, close_order: false, delivered: false)}

    def self.get_from_user_and_table(user_id, table_id)
        order = Order.opened(user_id, table_id)
        if order.blank? && User.find_by(id: user_id) && Table.find_by(id: table_id)
            create_a_new(user_id, table_id)
            order = Order.opened(user_id, table_id)
        end
        order
    end
    
    def self.create_a_new(user_id, table_id)
        Order.create [user_id: user_id, table_id: table_id, close_order: false, delivered: false]
    end
end
