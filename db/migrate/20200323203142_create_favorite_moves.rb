class CreateFavoriteMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_moves do |t|
      t.integer :user_id
      t.integer :move_id
      t.integer :rating
      t.text :comments

      t.timestamps
    end
  end
end
