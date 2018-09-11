Rails.application.routes.draw do
    
    devise_for :users, controllers: {registrations: 'registrations'}
    
    resources :countries do
        resources :cities
    end

    root 'countries#index'
end
