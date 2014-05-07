Blocitoff::Application.routes.draw do
  devise_for :users
	resources :todos, only: [:index, :new, :create, :show, :destroy]

  get "welcome/index"
	root to: 'welcome#index'
end
