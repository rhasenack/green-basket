class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :baskets
      # t.references :user
      t.float :price
      t.string :status

      t.timestamps
    end
  end
end
