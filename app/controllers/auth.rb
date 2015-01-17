
get '/login' do
  erb :'/auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

# UPLOAD A PIC - IN PROGRESS FOR FUTURE FEATURE

post '/upload' do
  File.open('uploads/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "Your image was successfully uploaded!"
end
