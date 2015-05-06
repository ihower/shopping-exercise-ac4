class AddPositionToProduct < ActiveRecord::Migration

  def change
    add_column :products, :row_order, :integer
    add_index :products, :row_order
  end

end
