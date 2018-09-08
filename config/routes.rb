Rails.application.routes.draw do
    
    devise_for :users
    
    resources :countries do
        resources :cities
    end

    root 'countries#index'
end
