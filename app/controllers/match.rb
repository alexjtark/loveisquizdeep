get '/matches' do
  @user = current_user
  erb :'match/all'
end

post '/match/:user_id/quiz/:quiz_id' do |user_id, quiz_id|
  Match.create(friender: current_user, friendee: User.find(user_id))
  TakenQuiz.find(quiz_id).reviewed = true
  redirect '/home'
end

delete '/match/:id' do |id|
  match = Match.find_record(current_user, User.find(id))
  Match.destroy(match)
  redirect '/home'
end

