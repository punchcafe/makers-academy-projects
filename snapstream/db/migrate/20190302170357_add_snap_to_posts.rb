class AddSnapToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :snap, :string
  end
end
