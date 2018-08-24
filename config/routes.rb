Rails.application.routes.draw do

  devise_for :users
    resources :countries

    root 'countries#index'
end
