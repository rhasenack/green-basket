class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.string :description
      t.string :address
      t.float :price
      t.integer :stock
      # t.references :user

      t.timestamps
    end
  end
end
