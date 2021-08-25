class ChangeDescriptionTypeInBaskets < ActiveRecord::Migration[6.0]
  def change
    change_table :baskets do |t|
      t.change :description, :text
    end
  end
end
