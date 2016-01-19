Rails.application.routes.draw do
  root 'home#index'
  resources :opportunities, :volunteers, :ngos, :interests, :password_resets, :sessions
  resources :users do
    member do
      get :confirm_email
    end
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/myinterests' => 'interests#my_interests'
  get '/myopportunities' => 'opportunities#my_opportunities'
  get 'password_resets/new'
  post 'sessions/new' => 'users#resend_token'
end
