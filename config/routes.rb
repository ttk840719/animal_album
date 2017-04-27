Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
	resources :animals #animals_controller

	root "animals#index"
end
