Rails.application.routes.draw do
  root 'sessions#new'
  resource :sessions, only: [:new, :create, :destroy]

  namespace :manager do
    root to: 'servers#index', as: :root
    resource :profile, only: [:show]
    resources :servers, only: [:index] do
      resources :disk_reports, only: [:index]
    end
  end
end
