Rails.application.routes.draw do
  devise_for :users
  root "rooms#index"
  resources :rooms do
    resources :chats
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
end
