class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.references :size, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :item_condition_id, null: false
      t.integer :postage_payer_id, null: false
      t.integer :prefecture_code, null: false
      t.integer :preparation_day_id, null: false
      t.integer :status_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end