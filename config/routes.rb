Rails.application.routes.draw do
  root 'chats#index'
  resources :chats, except: [:new, :show] do
    collection do
      post :confirm
    end
  end
end
