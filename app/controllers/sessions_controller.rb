class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to posts_path
    else
      flash[:danger] = "Combinación de email/password errónea."
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'Hasta luego, te estaremos esperando!"'
    redirect_to root_url
  end

end
