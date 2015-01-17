class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true

  has_many :answers
  has_many :quizzes
  has_many :matches
  has_many :taken_quizzes
  # has_many :created_quizzes, class_name: "TakenQuiz", through: :quizzes, source:

  def get_matched_users
    matched_users = []
    self.matches.each do |match|
      if match.friendee != self
        matched_users << match.friendee
      else
        matched_users << match.friender
      end
    end
      matched_users
  end


  def unreviewed_quizzes
    unreviewed_quizzes = []
    for i in user.quizzes
      unreviewed_quizzes << TakenQuiz.where("quiz_id = ? AND reviewed = ?", i.id, false)
      end
    unreviewed_quizzes
  end

end



