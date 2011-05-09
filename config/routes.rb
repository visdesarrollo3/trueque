Trueque::Application.routes.draw do
  get "received_books/index"

  resources :grades

  get "admin/index"

  scope(:path_names => { :new => "nuevo", :edit => "editar" }) do
    
    namespace :admin do
      resources :pages, :surveys, :comments, :trades
    end

    resources :banners
    resources :survey_votes, :only => [:create]
    resources :surveys, :path => "encuestas"
    
    resources :trades, :path => "trueque" do
      resources :comments
      member do
        post 'ignore'
        post 'accept'
        get 'pre_accept'
      end
      
      collection do
        get 'completed'
      end
    end
    
    resources :vitamins, :path => "vitamina-l" do
      resources :comments, :path => "comentarios"
    end
    
    resources :user_sessions
    resources :users, :path => "usuarios" do
      resources :comments, :path => "comentarios"
      resources :books, :path => "libros"
      resources :waiting, :only => :index, :path => "esperando"
    end
  
    resources :pages, :path => "paginas"
    resources :books, :path => "libros" do
      resources :comments, :path => "comentarios"
    end
    
  end
  
  

  match '/login' => "user_sessions#new", :as => :login
  match '/logout' => "user_sessions#destroy", :as => :logout

  


  
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

  match '/authors/list' => "authors#list", :as => :authors_list
  match '/tags/list'    => "tags#list",    :as => :tags_list

  root :to => "navigation#site_index"

  # See how all your routes lay out with "rake routes"
  match '/:id' => 'pages#show',   :as => :static
  match '/:id' => 'pages#modal',  :as => :static_modal
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
