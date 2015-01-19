class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :creator_id
      t.string :catchphrase
      t.timestamps
    end
  end
end
