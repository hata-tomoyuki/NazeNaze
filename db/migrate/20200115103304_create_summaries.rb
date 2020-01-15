class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.integer :theme_id
      t.text :text
      t.timestamps
    end
  end
end
