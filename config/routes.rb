Rails.application.routes.draw do
  devise_for :users

  # Userログイン状態でのルートパス
  authenticated :user do
    root "top#index", as: "user_authenticated_root"
  end

  # User非ログイン状態でのルートパス
  root 'top#index'
end
