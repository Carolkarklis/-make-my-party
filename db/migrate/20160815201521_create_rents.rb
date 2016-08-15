class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.date :initial_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
