class CreateWrestlers < ActiveRecord::Migration[6.0]
  def change
    create_table :wrestlers do |t|
      t.string :name
      t.text :bio
      t.string :img_url

      t.timestamps
    end
  end
end
