Rails.application.routes.draw do
  devise_for :admin
  devise_for :end_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    get '/' => "homes#top",as: 'home'
    get 'homes/about' => "homes#about",as: 'about'
    resource :end_users,only:[:edit,:update]
    get 'end_users/mypage' => 'end_users#show'
    patch "/end_users/hide" => "end_users#hide"
    get "/end_users/hide_confirm" => "end_users#hide_confirm"
    resources :items,only:[:index,:show]
    resources :cart_items,only:[:index,:update,:destroy]
    delete '/cart_items/all_destroy' => 'cart_items#all_destroy', as: 'cart_items_all_delete'
    post '/cart_items/add_item' => 'cart_items#add_item'
  end

  namespace :admin do
    get 'homes/top'
    resources :end_users
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items
  end

end
