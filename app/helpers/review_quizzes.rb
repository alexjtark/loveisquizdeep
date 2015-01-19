def unreviewed_quizzes(user)
  all_results = Hash.new
  user.unreviewed_quizzes.each do |quiz|
    qas = quiz.format_quiz_results # ary of doublets - [q,a]
    all_results[[quiz.id, quiz.user]] = qas
  end
  all_results
end