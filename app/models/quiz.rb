class Quiz < ActiveRecord::Base
  has_many :questions
  belongs_to :user
  has_many :answers, through: :questions
  has_many :taken_quizzes
end
