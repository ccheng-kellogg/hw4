class UsersController < ApplicationController

def show
  @user = User.find_by({ "id" => params["id"] })
end

def new
end

def create
  @user = User.new
  @user.username = params["username"]
  @user.email = params["email"]
  @user.password = BCrypt::Password.create(params["password"])
  @user.save
    # If the user is saved successfully, redirect them to the login page
    redirect_to "/login"
end
end