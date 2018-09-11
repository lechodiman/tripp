Rails.application.routes.draw do
    
  

    devise_for :users
    
    resources :countries do
        resources :cities do 
            resources :hotels do
            	
            end
        	
        end
    end

    root 'countries#index'
end
