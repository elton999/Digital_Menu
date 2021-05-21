class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: true, default: ""

      t.timestamps      
    end

    add_reference :dishes, :category, foreign_key: true
  end
end
