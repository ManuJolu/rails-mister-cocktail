Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:new,:create, :destroy]
  end
  resources :ingredient, only: [:index, :new, :create, :destroy]
end
