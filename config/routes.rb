Rails.application.routes.draw do
    
  get 'hotels/index'

  get 'hotels/new'

  get 'hotels/show'

    devise_for :users
    
    resources :countries do
        resources :cities do 
            resources :hotels do
            	
            end
        	
        end
    end

    root 'countries#index'
end
