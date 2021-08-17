class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :name

      t.timestamps
    end
    add_index :breeds, :name
  end
end
