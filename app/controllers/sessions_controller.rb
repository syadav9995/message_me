class SessionsController < ApplicationController
  before_action :user_already_loged_in, only: [:new, :create]
 
  def new
  end

  def create
    user =  User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]= "#{user.user_name} loged in successfully"
      redirect_to root_path
    else
      render 'new'
      flash[:error]= "something is wrong"
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:success]= "you are sucessfully logged out"
    redirect_to login_path
  end

  private

  def user_already_loged_in
    if logged_in?
      flash[:sucess] = "already loged in"
      redirect_to root_path
    end
  end
end
