LesliAdmin::Engine.routes.draw do
  
    root to: "dashboards#show"
    resource :dashboard, only: [:show]

    resource :profile

    resource :account, only: [:show]
    resources :users, only: [:index, :show, :new]
end
