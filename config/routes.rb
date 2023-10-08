Rails.application.routes.draw do
  devise_for :users
  scope module: :public do
    root to:'homes#top' #トップページ
      #イベントの一覧、詳細、登録(画面、処理)、編集
    resources :events, only: [:index, :show, :new, :create, :edit] do
      #投稿の一覧、投稿(画面、処理)、詳細、投稿の削除
      resources :posts, only: [:index, :new, :create, :show, :destroy] do
        resource :favorite, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
      end
    end
      #新規登録(画面、処理)、マイページ、登録情報編集(画面、処理)、ユーザーの退会処理
    resources :users, only: [:new, :create, :show, :edit, :update,:destroy]
    # ログイン画面、ログイン処理、ログアウト処理
    resources :sessions, only: [:new, :create, :destroy]
  end

    namespace :admin do
      root to: 'homes#top'
      resources :sessions, only: [:new, :create, :destroy]
      resources :users, only: [:index, :show, :update]
      resources :comments, only: [:index, :destroy] do
        get :search, on: :collection
      end
    end
end
