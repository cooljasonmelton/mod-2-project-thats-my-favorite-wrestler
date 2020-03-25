class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.text :description
      t.string :img_url

      t.timestamps
    end
  end
end
