class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user #taker
      t.string :response
      t.string :prompt
      t.timestamps
    end
  end
end
