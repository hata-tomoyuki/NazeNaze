class CreateImportants < ActiveRecord::Migration[5.0]
  def change
    create_table :importants do |t|
      t.integer :post_id, unique: true
      t.timestamps
    end
  end
end
