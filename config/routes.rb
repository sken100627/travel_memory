Rails.application.routes.draw do
  devise_for :users
  root to: 'destinations#index'
  resources :destinations do
    resources :records
  end

end
