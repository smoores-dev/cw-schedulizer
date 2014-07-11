Schedulizer::Application.routes.draw do
  resources :events
  resources :employees
  resources :sessions, only: [:new, :create, :destroy]
  resources :event_employees, only: [:create, :destroy]
  resources :test
  root 'events#index'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  get '/api/events', to: API::EventsAPIController.action(:index)
  post '/api/events/destroy', to: API::EventsAPIController.action(:destroy)
  post '/api/events/create', to: API::EventsAPIController.action(:create)
  post '/api/events/update', to: API::EventsAPIController.action(:update)
  get '/api/event_employees', to: API::EventEmployeesAPIController.action(:index)
  post '/api/event_employees/destroy', to: API::EventEmployeesAPIController.action(:destroy)
  post '/api/event_employees/create', to: API::EventEmployeesAPIController.action(:create)
  post '/api/event_employees/update', to: API::EventEmployeesAPIController.action(:update)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
