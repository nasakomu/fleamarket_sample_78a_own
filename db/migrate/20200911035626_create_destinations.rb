class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string    :first_name, null: false
      t.string    :family_name, null: false
      t.string    :first_name_kana, null: false
      t.string    :family_name_kana, null: false
      t.string    :postal_code, null: false
      t.integer   :prefecture_code, null: false
      t.string    :city, null: false
      t.string    :house_number, null: false
      t.string    :room_number
      t.string    :phone_number, null: false
      t.references    :user, foreign_key: true
      t.timestamps
    end
  end
end
