Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end

  resources :user do
    resources :houses
  end

  resources :user_checklist, except: :update do
    collection do
      patch :update_checklist
    end
  end

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/lists'
  root 'welcome#index'

end
