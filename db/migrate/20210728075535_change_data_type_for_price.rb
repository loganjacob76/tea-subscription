class ChangeDataTypeForPrice < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :price, :float
  end
end
