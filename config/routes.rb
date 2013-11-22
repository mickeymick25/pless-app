PlessBootstrap::Application.routes.draw do

#	root :to => "home#index"
#	devise_for :users, :controllers => {:registrations => "registrations"}
#	resources :users

	unauthenticated do
		root to: "home#index", as: :unauthenticated_root
	end

	authenticated :user do
		root to: "dashboard#index", as: :authenticated_root
	end

	resources :dashboard, :only =>"index" do
    	get 'dashboard', to: "dashboard#index"
	end
	
	root :to => "home#index"

	resources :users
	devise_for :users, :path => '', :path_names => {
		:registrations => "registrations", 
		:sign_in => 'login', 
		:sign_out => 'logout', 
		:sign_up => 'register'
	}
end