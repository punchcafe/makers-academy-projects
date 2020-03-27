class AddMessageToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :message, :string
  end
end
