class RemoveDefaultFromNameBasket < ActiveRecord::Migration[6.0]
  def change
    remove_column :baskets, :name
  end
end
