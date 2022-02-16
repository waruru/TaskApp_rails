Rails.application.routes.draw do
  # Userログイン状態でのパス
  authenticated :user do
    root "user/top#index", as: "user_authenticated_root"
  end

  # User非ログイン状態でのルートパス
  root 'top#index'

  devise_for :users, module: 'user/devise', controllers: {
    registrations: 'user/devise/registrations',
  }

  resources :workspaces, only: [:index, :show, :new, :create, :destroy] do
    resource :workspace_users, only: [:create, :destroy]
    resource :boards, only: [:new, :create]

    scope module: :workspace do
      collection do
        resources :join_requests, only: [:index, :destroy], as: :workspace_join_request
      end
      resources :join_requests, only: [:new, :create]
    end
  end

  resources :boards, only: [:index, :show, :destroy] do
    resources :task_lists, only: [:new, :create]
    resource :board_users, only: [:create, :destroy]
  end

  resources :task_lists, only: [:destroy] do
    resources :tasks, only: [:new, :create]
  end
end
