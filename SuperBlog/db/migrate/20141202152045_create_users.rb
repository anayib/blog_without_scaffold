class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :empresa

      t.timestamps
    end
  end
end
