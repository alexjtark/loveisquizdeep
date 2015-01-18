get '/login' do
  erb :'/auth/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])

  if user
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/session/#{user.id}"
    else
      #error to inform user they logged in incorrectly
      redirect '/login'
    end

  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/session/#{user.id}"
  else
    #error to inform user they completed the form incorrectly
    redirect "/signup"
  end
end

get '/session/:id' do |id| #view own page?
  @user = User.find(id)
  erb :'session/show'
end

get '/session/:id/edit' do |id|
  @user = User.find(id)
  erb :'session/edit'
end

put '/session/:id' do |id|
  user = User.find(id)
  user.update(params[:user])
  redirect ("/session/#{user.id}")
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

# UPLOAD A PIC - IN PROGRESS FOR FUTURE FEATURE

post '/upload' do
  File.open('uploads/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "Your image was successfully uploaded!"
end
