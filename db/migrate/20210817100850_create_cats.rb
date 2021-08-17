class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
