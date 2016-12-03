Rails.application.routes.draw do
  root 'sessions#new'
  resource :sessions, only: [:new, :create, :destroy]

  namespace :manager do
    root to: 'welcome#index', as: :root
  end
end
