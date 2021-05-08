class AccessController < ApplicationController

  before_action :confirm_logged_in, except: [:new, :create]

  # Display menu
  def menu
    @user_id = session[:user_id]
  end

  # Display login form
  def new
  end

  # Process login form
  def create
    logger.info("*** Login User #{session[:user_id]}")
    cookies[:username] = params[:username]
    session[:user_id] = 1483
    cookies[:language] = 'en'
    flash[:notice] = "Login successful"
    redirect_to(menu_path)
  end

  # Logout user
  def destroy
    logger.info("*** Logout User #{session[:user_id]}")
    session[:user_id] = nil
    redirect_to(login_path)
  end

end
