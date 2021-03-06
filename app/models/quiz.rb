class Quiz < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  has_many :questions
  has_many :answers, through: :questions
  has_many :taken_quizzes
end
