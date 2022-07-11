class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :deskripsi
      t.float :total
      t.references :penyalur, null: false, foreign_key: true
      t.references :pengumpul, null: false, foreign_key: true

      t.timestamps
    end
  end
end
