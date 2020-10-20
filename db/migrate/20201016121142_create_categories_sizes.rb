class CreateCategoriesSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_sizes do |t|
      t.references :category, foreign_key: true
      t.references :size, foreign_key: true
      t.timestamps
    end
  end
end
