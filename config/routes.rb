Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  ActiveAdmin.routes(self)
  resources :trainings, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :series, only: [:create, :update]
    resources :seances, only: [:index, :show, :create, :delete]
  end

  resources :series, only: [:destroy]

  resources :profiles, only: [:new, :create, :show, :edit, :update]

  root to: "pages#home"

  match "/404", :to => "errors#not_found", :via => :all
        match "/500", :to => "errors#internal_server_error", :via => :all

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
