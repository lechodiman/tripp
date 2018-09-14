Rails.application.routes.draw do
    



    devise_for :users, controllers: {registrations: 'registrations'}

    resources :posts 
    resources :countries do
        resources :cities do 
            resources :hotels do
            	
            end

            resources :citywalks do
                
            end
        	
        end
    end

    root 'countries#index'
end
