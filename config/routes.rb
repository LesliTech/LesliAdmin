LesliAdmin::Engine.routes.draw do
    root to: "dashboards#show"
    resource :dashboard, only: [:show]

    resource :account, only: [:show, :update]
    resources :users, only: [:index, :show, :new, :update, :create, :destroy] do

        # extensions to the users methods
        collection do
            get :list
        end
    end
end
