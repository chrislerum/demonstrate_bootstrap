Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  root 'bottles#index'
  resources :bottles
  get 'resume' => 'resume#index'
end
