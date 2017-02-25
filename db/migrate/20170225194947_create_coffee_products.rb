class CreateCoffeeProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :coffee_products do |t|
      t.string :name
      t.references :coffee_type, { foreign_key: true }
      t.float :price

      t.timestamps
    end
  end
end
