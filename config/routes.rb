Trueque::Application.routes.draw do
  resources :banners

  match '/login' => "user_sessions#new", :as => :login
  match '/logout' => "user_sessions#destroy", :as => :logout

  resources :trades
  resources :user_sessions
  resources :users do
    resources :comments
    resources :books
  end

  get "tags/list"

  resources :pages
  resources :books do
    resources :comments
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  match '/authors/list/' => "authors#list", :as => :authors_list
  match '/tags/list/'    => "tags#list", :as => :tags_list

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "navigation#site_index"

  # See how all your routes lay out with "rake routes"
  match '/:id' => 'pages#show', :as => :static
  match '/:id' => 'pages#modal', :as => :static_modal
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
