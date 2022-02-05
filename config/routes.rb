Rails.application.routes.draw do
  devise_for :users, module: 'user/devise'

  # Userログイン状態でのパス
  authenticated :user do
    root "top#index", as: "user_authenticated_root"
  end

  # User非ログイン状態でのルートパス
  root 'top#index'

  resources :workspaces, only: [:index, :new, :create]
end
