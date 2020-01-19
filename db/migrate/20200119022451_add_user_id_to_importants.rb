class AddUserIdToImportants < ActiveRecord::Migration[5.0]
  def change
    add_column :importants, :user_id, :integer
  end
end
