class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.string :description
      t.float :price
      t.string :category
      t.timestamps
    end
  end
end
