class AddShopaddressToPoss < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :shopaddress, :string
    add_column :posts, :shopname, :string
  end
end
