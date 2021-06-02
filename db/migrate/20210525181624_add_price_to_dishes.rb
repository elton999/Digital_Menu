class AddPriceToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :price, :float, null: false, default: false
  end
end
