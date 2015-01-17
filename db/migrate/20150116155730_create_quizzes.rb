class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.references :user
      t.string :catchphrase
      t.text :prompts
      t.timestamps
    end
  end
end
