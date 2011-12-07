Ldtrkpoc1svr::Application.routes.draw do
  resources :widgets

  get "home/index"

  root :to => 'home#index'
end
