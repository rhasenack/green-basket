class AddCoordinatesToBaskets < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :latitude, :float
    add_column :baskets, :longitude, :float
  end
end
