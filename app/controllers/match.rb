get '/matches' do
  @user = current_user
  erb :'match/all'
end