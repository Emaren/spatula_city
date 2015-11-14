class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.money :price
      t.text :info

      t.timestamps null: false
    end
  end
end
