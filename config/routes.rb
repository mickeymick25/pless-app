PlessBootstrap::Application.routes.draw do

#	root :to => "home#index"
#	devise_for :users, :controllers => {:registrations => "registrations"}
#	resources :users

	root :to => "home#index"
	devise_for :users, :path => '', :path_names => {:registrations => "registrations", :sign_in => 'login', :sign_out => 'logout'}
	resources :users

	unauthenticated do
		root to: "home#index", as: :unauthenticated_root
	end

	authenticated :user do
		root to: "dashboard#index", as: :authenticated_root
	end
end