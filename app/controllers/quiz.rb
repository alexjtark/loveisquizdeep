get '/quiz/new' do
 erb :'/quiz/new'
end

post '/quiz/new' do
  quiz = Quiz.new(params[:quiz], creator_id: User.find(session[:user_id]).id)

  if quiz.save
    quiz.generate_questions(params[:question])
    redirect '/home'
  end
end

get '/quiz/:id/show' do
  erb :'/quiz/show'
end

put 'quiz/show' do
 # create answers and taken_quiz, check for matches
end

