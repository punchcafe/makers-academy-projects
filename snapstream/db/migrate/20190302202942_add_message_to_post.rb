class AddMessageToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :message, :string
  end
end
