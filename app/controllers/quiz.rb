get '/createquiz' do
 erb :'/quiz/create_quiz'
end

post '/createquiz' do
  quiz = Quiz.new(params[:quiz])
end
