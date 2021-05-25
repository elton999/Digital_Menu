class AddPriceToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column_null :dishes, :price, :float, false
  end
end
