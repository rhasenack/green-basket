class AddNameToBaskets < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :name, :string, default: 'Basket'
  end
end
