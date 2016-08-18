class RemoveQuantityFromRents < ActiveRecord::Migration[5.0]
  def change
    remove_column :rents, :quantity, :integer
  end
end
