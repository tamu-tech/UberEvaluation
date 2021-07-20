class RenameContentColumnToPosts < ActiveRecord::Migration[5.2]
  def change
     rename_column :posts, :content, :shopcontent
  end
end
