class TakenQuiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  def quiz_taker
    self.user
  end

  def quiz_creator
    self.quiz.creator
  end

  def get_answers
    quiz.answers.where(user_id: self.quiz_taker.id)
  end

  def format_quiz_results #returns ary of tuples format [ques, ans]
    ques_ans = []
    self.get_answers.each do |answer|
      ques_ans << [answer.prompt, answer.response]
    end
    ques_ans
  end

#for seed data########################

 def self.take_quiz(user, quiz)
    if user != quiz.creator
      quiz.questions.each do |question|
        question.answers.create(response: Faker::Lorem.sentence, user_id: user.id, prompt: question.prompt)
      end
    end
    TakenQuiz.create(user_id: user.id, quiz_id: quiz.id)
  end

end
