class AddUserToBaskets < ActiveRecord::Migration[6.0]
  def change
    add_reference :baskets, :user, null: false, foreign_key: true
  end
end
