ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"
  #
  #map.resources :teams do |t|, :has_many => [ :events, :members ], :shallow => true
  #map.resources :events, :has_many => [ :event_attributes, :event_participants, :event_participant_availabilities ], :shallow => true
  #map.resources :users, :member => { :edit_event_availability => :get, :event_availability => :put }

  map.resources :teams, :shallow => true do |t|
    t.resources :events, :member => { :schedule => :get, :create_schedule => :post, :update_schedule => :put } do |e|
      e.resources :event_attributes
    end
    t.resources :event_participants, :only => :index do |ep|
      t.resources :event_participant_atts
    end
    t.resources :users, :member => { :edit_event_availability => :get, :event_availability => :put } do |u|
      u.resource :member
    end
  end

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
