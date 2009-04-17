ActionController::Routing::Routes.draw do |map|
  map.resources :users, :has_many => :shirts
  map.resources :sent, :mailbox
  map.resources :messages, :member => { :reply => :get }
  map.resource  :session
  map.resources :profiles
  map.resources :shirts, :collection => {:filter_by_size => :get}

  #restful_authentication
  map.signup  '/signup', :controller => 'users',   :action => 'new'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy' 

  #Home Page
  map.root :controller => 'shirts'

  # Home route leads to inbox
  map.inbox '/inbox', :controller => "mailbox", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
