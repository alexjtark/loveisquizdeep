class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :quiz
      t.string :prompt
      t.timestamps
    end
  end
end
