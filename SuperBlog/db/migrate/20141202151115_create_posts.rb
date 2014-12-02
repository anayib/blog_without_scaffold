class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.datastamp :fecha
      t.boolean :publicado
      t.text :contenido
      t.integer :user_id

      t.timestamps
    end
  end
end
