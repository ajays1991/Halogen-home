Rails.application.routes.draw do
  resources :cars
  # devise_for :users
  # devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations' }

  # login routes

  post '/auth/login', :to => 'authentication#login'

  post '/auth/create', :to => 'user#create'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts
  
  namespace :api do
  	namespace :v1 do
      resources :start_locations
      resources :destinations
      resources :fly_zones
      resources :flight_plans
      resources :flights
      resources :locations
      resources :drones do 
        collection do
          post :analytics
        end
      end
      resources :control_centers do
        collection do
          get :start
        end
      end
      resources :camera_logs
      resources :gps_beamer_logs

      resources :assignment_types
      resources :projects
      resources :members
      resources :statuses
      resources :tasks
      resources :attachments
  	end
  end

  namespace :api do
    namespace :elastic do
      resources :events
      resources :rules
    end
  end

  namespace :api do
    namespace :yilli do
      resources :bookings
      resources :languages
      resources :profiles
      resources :rates
      resources :rooms
      resources :slots
      resources :users
    end
  end

  

  ####### Home page routes ####################################

  get '/home2', :to => 'home#home2'


  ########

  ################### Block change routes ######################

  get '/', :to => 'home#index'
  get '/jobs', :to => 'blog#jobs'
  get '/signin', :to => 'blog#signin'
  get '/signup', :to => 'blog#signup'
  get '/contact', :to => 'blog#contact'  
  get '/coming', :to => 'blog#coming'
  get '/index2', :to => 'home#index2'
  ###############################################################

  get '/flight-center', :to => 'dashboard#flight_center'

  get '/dashboard', :to => 'dashboard#index'
  get '/flights', :to => 'dashboard#flights'
  get '/flight', :to => 'dashboard#flight'
  get '/drones', :to => 'dashboard#drones'
  get '/drone', :to => 'dashboard#drone'
  get '/flight-plans', :to => 'dashboard#flight_plans'
  get '/flight-plan', :to => 'dashboard#flight_plan'
  get '/fly-zones', :to => 'dashboard#fly_zones'
  get '/fly-zone', :to => 'dashboard#fly_zone'
  get '/destinations', :to => 'dashboard#destinations'
  get '/destination', :to => 'dashboard#destination'
  get '/start-locations', :to => 'dashboard#start_locations'
  get '/start-location', :to => 'dashboard#start_location' 
  get 'locations', :to => 'dashboard#locations'
  get 'location', :to => 'dashboard#location'

  get '/locations/new', :to => 'dashboard#location_new'
  get '/destinations/new', :to => 'dashboard#destination_new'
  get '/start_locations/new', :to => 'dashboard#start_location_new'
  get '/flight_plans/new', :to => 'dashboard#flight_plan_new'
  get '/drones/new', :to => 'dashboard#drone_new'
  get '/flights/new', :to => 'dashboard#flight_new'


  get '/cards', :to => 'dashboard#cards'
  ###############################################################

  get '/blocksys', :to => 'home#index'
  get '/signup', :to => 'home#signup'
  get '/aboutus', :to => 'home#aboutus'
  get '/blog', :to => 'home#blog'
end
