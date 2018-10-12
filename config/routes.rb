Rails.application.routes.draw do
    
  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

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

            resources :restaurants do
                resources :reviews, module: :restaurants
                
            end
        	
        end
    end

    root 'countries#index'
end
