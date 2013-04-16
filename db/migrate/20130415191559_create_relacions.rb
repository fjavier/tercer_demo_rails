class CreateRelacions < ActiveRecord::Migration
  def change
    create_table :relacions do |t|
      t.integer :seguidor_id
      t.integer :siguiendo_id

      t.timestamps
    end
     add_index :relacions, :seguidor_id
     add_index :relacions, :siguiendo_id
     add_index :relacions, [:seguidor_id, :siguiendo_id], unique: true
  end
end
