class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.where(name: params[:name]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Неверная комбинация."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Сеанс завершен.'
  end
end
