class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :contenido
      t.integer :usuario_id
      t.timestamps
    end
    add_index :microposts, [:usuario_id, :created_at]
  end
end
