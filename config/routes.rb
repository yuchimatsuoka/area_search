Rails.application.routes.draw do
  root 'areas#index'
  devise_for :users
  resources :areas do
    resources :small_areas
  end
end
