class AddCloseOrderToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :close_order, :boolean, null: false, default: false
    add_column :orders, :delivered, :boolean, null: false, default: false
  end
end
