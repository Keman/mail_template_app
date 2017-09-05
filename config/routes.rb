Rails.application.routes.draw do
  root to: "home#index"

  resources :accounts
  resources :messages

  post '/deliver_mail' => 'home#deliver_mail'
end
