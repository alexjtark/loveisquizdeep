get '/quiz/new' do
 erb :'/quiz/new'
end

post '/quiz/new' do
  quiz = Quiz.new(params[:quiz])
  if quiz.save
    generate_questions(params[:questions], quiz.id)
  end
  redirect 'user/'
end
