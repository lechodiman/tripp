Rails.application.routes.draw do
    
    devise_for :users, controllers: {registrations: 'registrations'}

    resources :posts
    
    resources :countries, shallow: true do
        resources :cities do 
            resources :hotels do
            	resources :reviews, module: :hotels
            end

            resources :citywalks do
                resources :reviews, module: :citywalks
            end
        	
        end
    end

    root 'countries#index'
end
