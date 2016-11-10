Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails
  resources :ingredient, only: [:index, :new, :create, :destroy]
  resources :doses, only: [:new,:create, :destroy]
end
