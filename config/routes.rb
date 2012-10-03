MediaTimeline::Application.routes.draw do
  resources :sites do
    resources :captures
  end

  resources :captures

  match "/:from_year-:from_month-:from_day-:from_hour/through/:to_year-:to_month-:to_day-:to_hour" => "captures#index",
    :from_year  => /\d{4}/,
    :from_month => /\d{1,2}/,
    :from_day   => /\d{1,2}/,
    :from_hour  => /\d{1,2}/,
    :to_year    => /\d{4}/,
    :to_month   => /\d{1,2}/,
    :to_day     => /\d{1,2}/,
    :to_hour    => /\d{1,2}/

  match "/:year-:month-:day-:hour/:site/:id" => "captures#show",
    :year  => /\d{4}/,
    :month => /\d{1,2}/,
    :day   => /\d{1,2}/,
    :hour  => /\d{1,2}/

  match "/:year-:month-:day-:hour" => "captures#index",
    :year  => /\d{4}/,
    :month => /\d{1,2}/,
    :day   => /\d{1,2}/,
    :hour  => /\d{1,2}/

  root :to => 'home#index'
end
