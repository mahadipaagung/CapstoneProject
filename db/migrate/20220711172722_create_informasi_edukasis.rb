class CreateInformasiEdukasis < ActiveRecord::Migration[7.0]
  def change
    create_table :informasi_edukasis do |t|
      t.string :judul
      t.text :content

      t.timestamps
    end
  end
end
