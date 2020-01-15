class AddUserIdToSummary < ActiveRecord::Migration[5.0]
  def change
    add_column :summaries, :user_id, :integer
  end
end
