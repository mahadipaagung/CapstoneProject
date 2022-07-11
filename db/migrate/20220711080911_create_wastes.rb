class CreateWastes < ActiveRecord::Migration[7.0]
  def change
    create_table :wastes do |t|
      t.string :nama
      t.text :deskripsi
      t.float :harga
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
