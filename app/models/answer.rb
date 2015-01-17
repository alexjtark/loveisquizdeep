class Answer < ActiveRecord::Base
  belongs_to  :question
  belongs_to  :respondent, source: :user, class_name: "User"
end
