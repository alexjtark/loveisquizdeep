class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :friender_id
      t.integer :friendee_id
      t.timestamps
    end
  end
end
