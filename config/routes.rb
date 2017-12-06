Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  resources :trainings, only: [:index, :new, :create, :edit, :update] do
    resources :series, only: [:create, :update, :destroy]
  end

  resources :profiles, only: [:new, :create, :show, :edit, :update]

  root to: "trainings#index"

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
