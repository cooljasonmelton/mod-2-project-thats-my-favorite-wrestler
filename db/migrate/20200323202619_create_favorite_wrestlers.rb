class CreateFavoriteWrestlers < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_wrestlers do |t|
      t.integer :user_id
      t.integer :wrestler_id
      t.integer :rating
      t.text :comments

      t.timestamps
    end
  end
end
