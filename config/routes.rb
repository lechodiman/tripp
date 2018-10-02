Rails.application.routes.draw do
    
    devise_for :users, controllers: {registrations: 'registrations'}

    resources :posts
    
    resources :countries, shallow: true do
        resources :cities do
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
        end
    end

    root 'countries#index'
end
