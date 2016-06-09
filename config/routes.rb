Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "rooms#index", as: "authenticated_root"
  end

  root "welcome#index"

  resources :rooms do
    resources :chats
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
end
