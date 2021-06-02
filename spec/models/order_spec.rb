require 'rails_helper'

RSpec.describe Order, type: :model do
  context "get order" do
    it "with an invalid user" do
      Table.create([number: 1])
      table_id = Table.find_by(number: 1).id
  
      order = Order.get_from_user_and_table(0, table_id)
      expect(order.count).to be 0  
    end
    
    it "with an invalid table" do
      User.create ([ name: "John", email: "john@mail.com", password: "123456"])
      user_id = User.all.first.id

      order = Order.get_from_user_and_table(user_id, 0)
  
      expect(order.count).to be 0  
    end
  
    it "without an order created before" do
      User.create ([ name: "John", email: "john@mail.com", password: "123456"])
      Table.create([number: 1])

      user_id = User.all.first.id
      table_id = Table.find_by(number: 1).id
  
      order = Order.get_from_user_and_table(user_id, table_id)
      expect(order).to be_truthy  
    end

    it "with an order created before" do
      User.create ([ name: "John", email: "john@mail.com", password: "123456"])
      Table.create([number: 1])

      user_id = User.all.first.id
      table_id = Table.find_by(number: 1).id

      Order.create_a_new(user_id, table_id)
      order_created_before = Order.opened(user_id, table_id)
  
      order = Order.get_from_user_and_table(user_id, table_id)
      expect(order.id).to be order_created_before.id   
    end
  end

end
