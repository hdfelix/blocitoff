Blocitoff::Application.routes.draw do
  devise_for :users
  get "welcome/index"
	resources :todos, only: [:index, :new, :create, :show]

	root to: 'welcome#index'
end
