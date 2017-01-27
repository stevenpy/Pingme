Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pings do
    resources :comments
  end

  root 'pings#index'
  get ':user_name', to: 'profiles#show', as: :profile
end
