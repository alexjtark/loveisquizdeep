get '/matches' do
  @user = current_user
  erb :'match/all'
end

post '/match/:id' do
  Match.create(friender: current_user, friendee: User.find(id))
end

