class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :size
      t.references :brand, foreign_key: true
      t.integer :item_condition, null: false
      t.integer :postage_payer, null: false
      t.integer :prefecture_code, null: false
      t.integer :preparation_day, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end