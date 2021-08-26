class AddNewColumnNameToBasket < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :name, :string
  end
end
