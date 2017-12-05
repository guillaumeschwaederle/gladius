Rails.application.routes.draw do
  get 'series/create'

  get 'series/update'

  get 'series/destroy'

  get 'trainings/index'

  get 'trainings/new'

  get 'trainings/create'

  get 'trainings/edit'

  get 'trainings/update'

  get 'profiles/new'

  get 'profiles/create'

  get 'profiles/show'

  get 'profiles/edit'

  get 'profiles/update'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
