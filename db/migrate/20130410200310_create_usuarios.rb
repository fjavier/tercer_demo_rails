class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_column :usuarios, :password_digest, :string
    add_column :usuarios, :admin, :boolean, default: false
    add_column :usuarios, :remember_token, :string
    add_index :usuarios, :email, unique:true
    add_index  :usuarios, :remember_token
  end
end