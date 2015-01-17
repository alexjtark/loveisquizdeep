class Answer < ActiveRecord::Base
  belongs_to  :question
  belongs_to :quiz, through: :questions
  belongs_to  :user
end
