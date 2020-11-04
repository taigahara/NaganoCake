Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :public do
    resource :end_users
    root 'homes#top'
    get 'homes/about'
  end
end
