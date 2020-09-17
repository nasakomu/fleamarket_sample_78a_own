class RenameSizeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :size, :size_id
    rename_column :items, :item_condition, :item_condition_id
    rename_column :items, :postage_payer, :postage_payer_id
    rename_column :items, :preparation_day, :preparation_day_id
    rename_column :items, :status, :status_id
  end
end