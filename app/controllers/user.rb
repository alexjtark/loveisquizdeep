get '/user/all' do
  @users = User.all
  erb :'user/all'
end

get '/home' do
  @user = current_user
  erb :'user/home'
end

get '/user/:id' do |id|

  @user = User.find(id)
  erb :'user/show'
end

get '/profile/edit' do
  @user = current_user
  erb :'user/edit'
end

put '/profile/edit ' do
  user = current_user
  user.update(params[:user])
  redirect "/home"
end

