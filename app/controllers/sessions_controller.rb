class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by(name: login_params[:name])
    if user
      p user.authenticate(login_params[:password])
      session[:id] = user.id
      redirect_to root_url
    else
      # display error
      render 'login'
    end
  end

  def logout
  end

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
