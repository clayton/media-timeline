MediaTimeline::Application.routes.draw do
  resources :sites
  resources :captures
  match "/:year/:month/:day/:hour" => "captures#index",
    :year => /\d{4}/,
    :month => /\d{1,2}/,
    :day => /\d{1,2}/,
    :hour => /\d{1,2}/

  root :to => 'home#index'
end
