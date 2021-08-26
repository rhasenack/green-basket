class AddOriginalStockToBaskets < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :original_stock, :integer
  end
end
