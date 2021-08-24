class AddStatusToBasket < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :status, :string, default: 'available'
  end
end
