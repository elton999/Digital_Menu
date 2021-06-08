require 'rails_helper'

RSpec.describe OrderItem, type: :model do
    it "validate order" do
        
        user = User.new
        user.name = "John"
        user.email = "john@mail.com"
        user.password = "123456"
        user.save

        table = Table.new
        table.number = 1
        table.save

        order = Order.new
        order.user_id = user.id
        order.table_id = table.id
        order.save

        category = Category.new
        category.name = "category 1"
        category.save

        dish = Dish.new
        dish.name = "dish 1"
        dish.price = 1
        dish.category_id = category.id
        dish.save

        item = OrderItem.new
        item.order_id = order.id
        item.dish_id = dish.id

        expect(item.valid?).to be_truthy  

    end
end
