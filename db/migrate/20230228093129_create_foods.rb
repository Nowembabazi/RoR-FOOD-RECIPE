class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement
      t.decimal :unit
      t.decimal :price
      t.decimal :quantity
      t.string :user
      t.integer :ID

      t.timestamps
    end
  end
end
