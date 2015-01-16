class CreateQuizes < ActiveRecord::Migration
  def change
    create_table :quizes do |t|
      t.references :user
      t.string :catchphrase
      t.timestamps
    end
  end
end
