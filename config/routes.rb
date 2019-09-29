Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #ユーザー関連のルーティング
  root 'home#index'
  get 'users/mypage', to: 'users#mypage'
  get 'users/edit', to: 'users#edit'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users

  #データの作成~削除のルーティング
  resources :columns
  
end
