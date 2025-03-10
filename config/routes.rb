    Rails.application.routes.draw do

      resources "entries"
      resources "places"
      resources "users"
      
      resources "sessions"
      get("/login", {:controller => "sessions", :action => "new"})
      get("/logout", {:controller => "sessions", :action => "destroy"})
      post "/login", to: "sessions#create"


      
      # Landing page (aka root route)
      get("/", {:controller => "sessions", :action => "new"})

    end
    #  get("/", { :controller => "places", :action => "index" })
  # resources "entries"
   #resources "places"
   #resources "sessions"
   #resources "users"

    #root "sessions#new"
  

    
   # get "/signup", to: "users#new"
    # post "/signup", to: "users#create"
  
   #get "/login", to: "sessions#new"
    #post "/login", to: "sessions#create"
    #delete "/logout", to: "sessions#destroy"
  
    #resources :places

# end
