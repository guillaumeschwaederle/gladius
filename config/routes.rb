Rails.application.routes.draw do

  resources :trainings, only: [:index, :new, :create, :edit, :update] do
    resources :series, only: [:create, :update, :destroy]
  end

  resources :profiles, only: [:new, :create, :show, :edit, :update]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
