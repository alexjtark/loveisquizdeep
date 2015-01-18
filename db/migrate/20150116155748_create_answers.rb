class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user #taker
      t.text :response
      t.text :prompt
      t.timestamps
    end
  end
end
