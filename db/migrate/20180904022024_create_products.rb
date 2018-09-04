class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :parent_id
      t.decimal :price

      t.timestamps
    end
  end
end
