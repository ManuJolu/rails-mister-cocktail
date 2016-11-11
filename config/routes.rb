Rails.application.routes.draw do

  root "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy], shallow: true
    resources :reviews, only: [:create]
  end
  mount Attachinary::Engine => "/attachinary"
end
