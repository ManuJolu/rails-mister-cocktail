Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:new, :create, :edit, :update, :destroy], shallow: true
  end
end
