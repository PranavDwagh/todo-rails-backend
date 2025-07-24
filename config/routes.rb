Rails.application.routes.draw do

  namespace :api do
    resources :todos do
      member do
        patch :update_completed
      end
      # patch '/todos/:id/update_completed', to: 'todos#update_completed'              // member equivalent to this line
    end

    # These are the default RESTful routes created by `resources :todos`:

    # GET    /todos             => todos#index
    # GET    /todos/new         => todos#new
    # POST   /todos             => todos#create
    # GET    /todos/:id         => todos#show
    # GET    /todos/:id/edit    => todos#edit
    # PATCH  /todos/:id         => todos#update
    # PUT    /todos/:id         => todos#update
    # DELETE /todos/:id         => todos#destroy
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
