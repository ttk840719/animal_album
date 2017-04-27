Rails.application.routes.draw do
  devise_for :users
	resources :animals #animals_controller

	root "animals#index"
end
