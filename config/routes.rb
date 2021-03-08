Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'posts#index'
  resource :posts, only: [:index, :new, :create]
end
