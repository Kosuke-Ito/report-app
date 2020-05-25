class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
    @login = Session.new
  end

  def create
    @login = Session.new(name: params[:session][:name], password: params[:session][:password])
    user = User.find_by(name: params[:session][:name])
    if @login.save && user && user.authenticate(@login.password)
      log_in user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/login'
  end
end
