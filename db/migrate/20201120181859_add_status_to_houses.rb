class AddStatusToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :status, :string
  end
end
