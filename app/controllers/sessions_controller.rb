class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth'] #Login through GitHub
      oauth_email = auth[:info][:email]
        if user = User.find_by(email: oauth_email) #we've seen this user before via oauth
          session[:user_id] = user.id
        else #first time seeing this person via oauth
          user = User.create(name: auth[:info][:name], email: oauth_email, password: SecureRandom.hex)
          session[:user_id] = user.id
        end
      redirect_to root_url, notice: "Logged in!"
    else #regular Log In
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      else
        flash.now.alert = "Email or password is invalid"
        render "new"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end


  private

  def auth
    request.env['omniauth.auth']
  end

end
