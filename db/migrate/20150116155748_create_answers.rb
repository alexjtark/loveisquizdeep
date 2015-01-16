class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user #taker
      t.string :answer
      t.timestamps
    end
  end
end
