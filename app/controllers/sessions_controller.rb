Instagram.configure do |config|
  config.client_id = ENV['client_id']
  config.client_secret = ENV['client_secret']
end

class SessionsController < ApplicationController

  def index

  end

  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => ENV['redirect_uri'])
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => ENV['redirect_uri'])
    session[:user_name] = response.user.full_name
    session[:access_token] = response.access_token
    redirect_to "/"
  end

  def logout
    session.clear
    redirect_to '/'
  end

end