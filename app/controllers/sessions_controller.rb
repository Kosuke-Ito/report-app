class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = '間違えている箇所があります。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/login'
  end
end
