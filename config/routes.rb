Rails.application.routes.draw do
  root 'sessions#new'
  resource :sessions, only: [:new, :create, :destroy]

  namespace :manager do
    root to: 'servers#index', as: :root
    resource :profile, only: [:show]
    get :requests, to: 'servers#requests'
    post 'accept/:id', to: 'servers#accept', as: :accept_request
    resources :servers, only: [:index] do
      resources :disk_reports, only: [:index]
      resources :notifications, only: [:index] do
        collection do
          put :update
        end
      end
      resources :process_reports, only: [:index], shallow: true do
        resources :activities, only: [:index]
      end
    end
  end


  mount MonitorSystem::API => '/'
end
