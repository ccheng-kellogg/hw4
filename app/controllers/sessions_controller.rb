class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # 1. Try to find the user by their email
    @user = User.find_by({ "email" => params["email"] })
  
    if @user
      # 2. Try to decrypt the stored password and compare to the submitted one
      if BCrypt::Password.new(@user["password"]) == params["password"]
        # 3. Successful login
        session["user_id"] = @user["id"]
        redirect_to "/places"  # <-- Change this to your real post-login path
      else
        # 4a. Incorrect password
        flash["notice"] = "Incorrect password. Try again."
        redirect_to "/login"
      end
    else
      # 4b. No user found with that email
      flash["notice"] = "No account with that email. Try again."
      redirect_to "/login"
    end
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end