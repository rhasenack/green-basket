class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true
      t.string :title
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
