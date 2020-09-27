class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :card_id
      t.string :customer_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
