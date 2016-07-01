Rails.application.routes.draw do
  resources :made_payments
  resources :due_payments
  resources :investments
  resources :projects
  resources :users
end
