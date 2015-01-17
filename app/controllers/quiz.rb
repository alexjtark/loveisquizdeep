get '/quiz/new' do
 erb :'/quiz/create_quiz'
end

post '/quiz' do
  quiz = Quiz.new(params[:quiz])
end


