Rails.application.routes.draw do

  devise_for :users #, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'pages#home'
  resources :users, only: [:show, :index, :update] do     
  	resources :tasks
    member do 
      get "edit_picture"
      patch "update_picture"
    end
  end
 
  resources :tasks, only: [] do 
		member do 
			post "done"
		end
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
