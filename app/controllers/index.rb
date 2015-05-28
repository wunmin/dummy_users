enable  :sessions

get '/' do
  @param = params
  @all_users = User.all
  erb :index
  # Display the login form
end

post "/login" do
  @user = User.where(email: params[:post][:email])
  @auth_result = @user.authenticate(params[:post][:email], params[:post][:password])
  if @auth_result == nil
    redirect to "/"
  else
    session[:user_id] = @auth_result.id
    redirect to "/secret_page"
  end
end

get "/create_user" do
  erb :create_user
end

post "/create_user" do
  @user = User.create(params[:post])

  if @user.valid?
    session[:user_id] = @user.id
    redirect to "/secret_page"
  else
    redirect to "/create_user"
  end
end

delete "/delete_user" do
  redirect to "/"
end

get '/secret_page' do
  if session[:user_id].nil?
    @all_users = User.all
    redirect to "/"
  else
    @user = User.find_by_id(session[:user_id])
    erb :user
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect to "/"
end