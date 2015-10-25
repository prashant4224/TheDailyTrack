CloudTrendz::Application.routes.draw do
  
  resources :products

  resources :orders

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  match '/payments/thank_you', :to => 'payments#thank_you', :as => 'payments_thank_you', :via => [:get]
  get "users/profile"
  match '/microposts/:id/approve',  to: 'microposts#to_approve'  , via: [:get, :post], as: 'approve_micropost'
  match '/microposts/to_approve',  to: 'microposts#approve'  , via: :get
  # match '/tickets/search', to: 'tickets#search', :via => [:get]
  # get 'search', to: 'search#search'
  resources :photos

  resources :tickets do
    collection do
      get :search, as: 'search'
    end
    member do
      get :trend
    end
  end
  resources :plans
  resources :phases
  resources :objectives



  resources :teams do
    collection do
      get :search, as: 'search'
    end
    resources :plans do
      resources :phases do
        resources :objectives do
          resources :tickets do
            resources :posts do 
              resources :comments
            end
          end
        end
      end
    end
  end

  resources :posts do 
    resources :comments
  end

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" } #, path_names: { sign_up: "register", sign_in: "login" }
  #devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  resources :comments
  #match "/sign_in" => "users#sign_in"
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    # get 'sign_out', :to => 'devise/sessions#destroy'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    #root 'posts#index'
    root 'tickets#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
