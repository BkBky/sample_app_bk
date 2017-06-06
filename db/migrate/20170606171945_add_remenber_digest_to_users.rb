class AddRemenberDigestToUsers < ActiveRecord::Migration[5.1]
  # ver en capitulo nueva la tabla (figure 9.1, agrega remember digest)
  def change
    add_column :users, :remember_digest, :string
  end
end
