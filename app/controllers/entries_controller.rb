class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by({ "id" => params["id"] })
    @place = Place.find_by({ "id" => @entry["place_id"] })
    # filter activities by contact and logged-in user (aka "salesperson")
  
  end


  def new
  end


  def create
    @entry = Entry.new
    @entry.user_id = session["user_id"]
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

  

  def edit
    @entry = Entry.find_by({ "id" => params["id"] })
  end
  
  def update
    @contact = Contact.find_by({ "id" => params["id"] })

    # only authorize logged-in user to edit contacts
    if User.find_by({ "id" => session["user_id"] }) != nil
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = params["password"]
      @user.save
    else
      flash["notice"] = "You must be logged in."
    end
    redirect_to "/login"
  end

end
