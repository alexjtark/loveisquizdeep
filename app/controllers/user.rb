get '/user/all' do
  @users = User.all
  erb :'user/all'
end


get '/user/:id' do |id|
  #view someone's page
  erb :'user/show'
end




