Rails.application.routes.draw do

    resources :countries

    root 'countries#index'
end
