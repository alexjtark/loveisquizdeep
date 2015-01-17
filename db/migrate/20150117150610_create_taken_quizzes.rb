class CreateTakenQuizzes < ActiveRecord::Migration
  def change
    create_table :taken_quizzes do |t|
      t.references :user
      t.references :quiz
      t.boolean :reviewed, default: false
    end
  end
end
