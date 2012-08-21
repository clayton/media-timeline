MediaTimeline::Application.routes.draw do
  get "home/index"

  resources :sites
  root :to => 'home#index'
end
