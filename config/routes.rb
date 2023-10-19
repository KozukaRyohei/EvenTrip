Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: 'admin/sessions'
    }

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }

  namespace :admin do
    resources :post_comments, only:[:index, :destroy]
    resources :users, only: [:index, :show, :update]
  end

  scope module: :public do
     root to:'homes#top' #トップページ
     post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
      #イベントの一覧、詳細、登録(画面、処理)、編集
    resources :events, only: [:index, :show, :new, :create, :edit,:update] do
      #投稿の一覧、投稿(画面、処理)、詳細、投稿の削除
      resources :posts, only: [:index, :new, :create, :show, :destroy] do
        resources :hashtags, only: [:show],param: :name
        resources :post_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
        resources :comments, only: [:create, :destroy]
      end
    end
      #新規登録(画面、処理)、マイページ、登録情報編集(画面、処理)、ユーザーの退会処理
    resources :users, only: [:new, :create, :show, :edit, :update,:destroy] do
      member do
        get :favorited_posts
      end
    end
  end
end
