get '/responses' do
  @all_results = unreviewed_quizzes(current_user)
  erb :'taken_quiz/results'
end

put "/pass/:id" do |id|
  TakenQuiz.find(id).reviewed = true
  redirect '/home'
end




