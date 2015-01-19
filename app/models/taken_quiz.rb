class TakenQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  def self.take_quiz(user, quiz) #for seed data
    if user != quiz.user
      quiz.questions.each do |question|
        question.answers.create(response: Faker::Lorem.sentence, user_id: user.id, prompt: question.prompt)
      end
    end
    TakenQuiz.create(user_id: user.id, quiz_id: quiz.id)
  end

  def render_results
    answers = Answer.where(user_id: self.user_id, )


  end


end
