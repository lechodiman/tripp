Rails.application.routes.draw do

    get 'all_users/show'

    get 'all_users/convert'

    get 'all_users/unconvert'

    get 'all_users/select_country'

    get 'all_users/assign_country'

    get 'comments/index'

    get 'comments/show'

    get 'comments/new'

    devise_for :users, controllers: {registrations: 'registrations'}

    get :search, controller: :main

    resources :users, only: [:show]
    
    resources :polls

    resources :poll_votes, only: [:create]

    resources :posts, shallow: true do
        resources :comments do
        end
        
        member do
            put "like", to: "posts#upvote"
            put "dislike", to: "posts#downvote"
            put "save" , to: "posts#saved"
        end
    end
    
    resources :countries, shallow: true do
        resources :cities do
            member do 
                put "save", to: "cities#saved"
            end
            resources :hotels do
                member do 
                    put "save" , to: "hotels#saved"
                end
            	resources :reviews, module: :hotels do
                    member do
                        put "like", to: "reviews#upvote"
                        put "dislike", to: "reviews#downvote"

                    end
                end
            end

            resources :citywalks do
                member do
                    put "save", to: "citywalks#saved"  
                end
                resources :reviews, module: :citywalks do
                    member do
                        put "like", to: "reviews#upvote"
                        put "dislike", to: "reviews#downvote"
                    end
                end
            end


            resources :restaurants do
                member do
                    put "save", to: "restaurants#saved"  
                end
                resources :reviews, module: :restaurants
                
            end
        	
        end
    end

    root 'countries#index'
end
