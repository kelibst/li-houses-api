class AddIsAdminFromUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isAdmin, :boolean, null: false, default: false
  end
end
