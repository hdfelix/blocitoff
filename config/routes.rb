Blocitoff::Application.routes.draw do
  get "welcome/index"
	resources :todos

	root to: 'welcome#index'
end
