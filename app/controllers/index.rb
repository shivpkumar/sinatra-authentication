get '/' do
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.authenticate(params[:user])
  if user != false
    create_session(user)
    redirect '/'
  else
    @error = "Name and password do not match"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  if user.valid?
    create_session(user)
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :sign_up
  end
end
