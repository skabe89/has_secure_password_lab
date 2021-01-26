class SessionsController < ApplicationController

  def create
    if session_params[:name]
      @user = User.find_by(name: session_params[:name])
      if @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
      end
    end
  end

  private

    def session_params
      params.require(:user).permit(:name, :password)
    end

end