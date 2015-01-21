class Quiz < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  has_many :questions
  has_many :answers, through: :questions
  has_many :taken_quizzes

  def generate_questions(add_questions)

    add_questions.each do |key, value|
      self.questions << Question.create(prompt: value)
    end
  end

end
