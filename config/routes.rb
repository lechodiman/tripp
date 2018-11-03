Rails.application.routes.draw do
    
    get 'comments/index'

    get 'comments/show'

    get 'comments/new'

    devise_for :users, controllers: {registrations: 'registrations'}

    get :search, controller: :main

    resources :users, only: [:show]
    
    resources :posts, shallow: true do
        resources :comments do
        end
        
        member do
            put "like", to: "posts#upvote"
            put "dislike", to: "posts#downvote"
        end
    end
    
    resources :countries, shallow: true do
        resources :cities do
            member do 
                put "save", to: "cities#saved"
            end
            resources :hotels do
            	resources :reviews, module: :hotels do
                    member do
                        put "like", to: "reviews#upvote"
                        put "dislike", to: "reviews#downvote"
                    end
                end
            end

            resources :citywalks do
                resources :reviews, module: :citywalks do
                    member do
                        put "like", to: "reviews#upvote"
                        put "dislike", to: "reviews#downvote"
                    end
                end
            end


            resources :restaurants do
                resources :reviews, module: :restaurants
                
            end
        	
        end
    end

    root 'countries#index'
end
