class SessionsController < ApplicationController
  
  def new

  end

  def create
    @user = User.find_by({"email" => params["email"]})
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "hello"
        redirect_to "/"
      else
        flash["notice"] = "Nope"
        redirect_to "/login"
      end
    else
      flash[""] = "Nope"
      redirect_to "/login"
    end
  end

  def destroy
  end
end
  