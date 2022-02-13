Rails.application.routes.draw do
  # Userログイン状態でのパス
  authenticated :user do
    root "user/top#index", as: "user_authenticated_root"
  end

  # User非ログイン状態でのルートパス
  root 'top#index'


  devise_for :users, module: 'user/devise'

  resources :workspaces, only: [:index, :show, :new, :create, :destroy] do
    resource :workspace_users, only: [:new, :create, :destroy]
    resource :boards, only: [:new, :create]
  end
  resources :boards, only: [:index, :show, :destroy] do
    resources :task_lists, only: [:new, :create]
    resource :board_users, only: [:create, :destroy]
  end

  resources :task_lists, only: [:destroy] do
    resources :tasks, only: [:new, :create]
  end
end
