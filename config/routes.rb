Rails.application.routes.draw do
  devise_for :users
  resources :users do 
    member do 
      get "posts"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, :controller => "post_comments" do
      collection do 
        get :latest
      end
    end
  end


  get "home" => "home#index"
  root :to => "home#index"
end
