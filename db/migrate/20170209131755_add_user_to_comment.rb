class AddUserToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer
    add_index :post_id
  end
end
