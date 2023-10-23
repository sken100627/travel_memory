Rails.application.routes.draw do
  devise_for :users
  root to: 'destinations#index'

end
