Rails.application.routes.draw do
  # Userログイン状態でのパス
  authenticated :user do
    root "user/top#index", as: "user_authenticated_root"
  end

  # User非ログイン状態でのルートパス
  root 'top#index'


  devise_for :users, module: 'user/devise'

  resources :workspaces, only: [:index, :show, :new, :create]
  resources :boards, only: [:index, :show, :new, :create]

  namespace :user do
    get 'top/index'
  end
end
