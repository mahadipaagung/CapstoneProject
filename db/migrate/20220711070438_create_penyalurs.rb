class CreatePenyalurs < ActiveRecord::Migration[7.0]
  def change
    create_table :penyalurs do |t|
      t.string :nama
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
