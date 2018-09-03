Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # Note: Home page is root for UnAuthenticated visitors
  #       This shall be at the top
  unauthenticated :user do
    get '/:locale' => 'pages#home', locale: /en|fi/
    root 'pages#home', page: :home
  end

  authenticate :user, ->(user) { user.vehicle_owner? } do
    get '/:locale' => 'vehicle_owners/quote_requests#index', locale: /en|fi/ # because iisifix.fi/en should be addressed
    root 'vehicle_owners/quote_requests#index'
  end

  authenticate :user, ->(user) { user.garage_owner? } do
    get '/:locale' => 'garage_owners/quote_requests#index', locale: /en|fi/
    root 'garage_owners/quote_requests#index'
  end

  authenticate :user, ->(user) { user.admin? } do
    root 'admins/dashboard#index'
  end

  devise_scope :user do
    get '/superuser', to: 'devise_override/sessions#new', defaults: {admin: true}
  end

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'vehicle_owners/omniauth_callbacks'}

  # ------------------------------------------------------------------------------
  scope "(:locale)", locale: /en|fi/ do
    devise_for :users, path: '',
               path_names:   { sign_up: :signup, sign_in: :login, sign_out: :logout },
               controllers:  {
                   registrations:      'devise_override/registrations',
                   confirmations:      'devise_override/confirmations',
                   sessions:           'devise_override/sessions'
               }, skip: :omniauth_callbacks

    resources :users, module: :vehicle_owners, as: :vehicle_owners, path: :customers do
      resource :confirmation, path: :confirm, only: [:edit, :update]
      resource :user, path: :profile, only: [:edit, :update]
      resources :quote_requests, path: :bids do
        member do
          patch :cancel
          patch :accept
          patch :reject
        end
      end

      resources :jobs do
        member do
          patch :cancel
          patch :confirm
        end
        resource :rating, only: :update
      end
    end

    resources :users, module: :garage_owners, as: :garage_owners, path: :garages do
      resource :confirmation, path: :confirm, only: [:edit, :update]
      resources :quote_requests, path: :bids do
        member do
          patch :respond
          patch :ignore
        end
      end

      resources :jobs do
        member do
          patch :start
          patch :complete
        end
      end
      resource :garage_profile, path: :profile, only: [:edit, :update]
    end

  resources :garages, path: :workshops, only: [:index, :show]
  resources :quote_requests, only: [:new, :create] do
    collection do
      get :validate_reg_num
      post :load_models
    end
  end

    resource :page, path: '/' do
      collection do
        get :home
        get :about
        get :contact
        get :how_it_works
        get :privacy_policy
        get :dashboard

        post :create_contact
        post :create_new_garage
      end
    end

    # -----------------------------------------------------------------------------------
    resources :conversation do
      resources :comments, only: :create
    end
  end
end
