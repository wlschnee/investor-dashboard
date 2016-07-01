Rails.application.routes.draw do
  root to: 'investments#index'
  resources :made_payments
  resources :due_payments
  resources :investments
  resources :projects
  resources :users
end
