Blocitoff::Application.routes.draw do
  devise_for :users
  get "welcome/index"
	resources :todos

	root to: 'welcome#index'
end
