class AddQuantityToRent < ActiveRecord::Migration[5.0]
  def change
    add_column :rents, :quantity, :integer
  end
end
