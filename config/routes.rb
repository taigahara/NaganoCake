Rails.application.routes.draw do
  devise_for :admin
  devise_for :end_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    get '/' => "homes#top",as: 'home'
    get 'homes/about' => "homes#about",as: 'about'
    resource :end_users
    get 'end_users/mypage' => 'end_users#show'
  end

  namespace :admin do
    get 'homes/top'
  end
end
