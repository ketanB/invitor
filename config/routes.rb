Invitar::Application.routes.draw do |map|
  
  
  ###----My Code---###
  resources :quotes do
    collection do
      get :quote_response
    end
  end
  ###---My Code---###

  #get "quotes/index"

  resources :states do
    ###---My Code---###
    collection do
      get :autocomplete
    end
    ###---My Code---###
    
  end
  
  resources :cities do
    collection do
      get :autocomplete
      get :load_states
    end
  end

  resources :reviews

  resources :attributes

  resources :companies do

    resources :reviews

    member do
      get :photos
      get :edit_info
      get :destory_info
      
      
      
    end

    collection do
      get :load_cities
      get :load_states
      get :load_business_categories
      post :delete_photo
      get :autocomplete_tags
      get :autocomplete_tags2
      get :search
      get :remote_search
      get :company_location
      post :create_info
      get :list_info
      get :dashboard
      post :create_response
      get :quotes
      get :messages
      get :message
      post :create_message
    end
  end

  resources :business_categories

  #---My codigo---#
  resources :business_groups do

    collection do
      get :search
      get :list
      get :detail
      
    end
  end
  #--end---#


  resources :contact_groups do
    collection do
      post :add_contatcs
    end
  end

  resources :comments do

    collection do
      get :by_event
      post :reply
      post :update_comment
    end
  end

  resources :themes

  resources :categories do
    member do
      get :assign_theme
    end
    collection do
      get :search
    end
  end

  resources :countries do
    member do
      get :assign_category
    end
  end


  get "site/index"
  get "site/help"
  get "site/populate_location"

  resources :invitations do
    member do
      post :guests_invite
    end
  end
  resources :password_reset

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match 'language/change(.:format)'   => 'site#change_language', :as => :change_language

  match 'invitation/new'              => 'events#new',        :as => :new_step_1
  match 'invitation/new/informations' => 'events#new_step_2', :as => :new_step_2
  match 'invitation/new/guests'       => 'events#new_step_3', :as => :new_step_3
  match 'invitation/new/preview'      => 'events#new_step_4', :as => :new_step_4

  match 'invitation/status/:id'           => 'invitations#status'
  match 'invitation/track_open_rate/:id'           => 'invitations#track_open_rate'

  resource :user_session
  
  match 'login'          => 'user_sessions#new'
  match 'logout'         => 'user_sessions#destroy'
  match 'contacts/new'                  => 'users#contacts_new',      :as => :new_contacts
  match 'contacts/:id/edit'             => 'users#update_contact',     :as => :update_contact
  match 'dashboard/quotes'         => 'users#my_quotes'
  match 'dashboard/quote'         => 'users#quote'
  match 'dashboard/quotes'         => 'users#my_quotes'
  match 'dashboard/quote_view'         => 'users#quote_view'
  match 'dashboard/quote_confirm'         => 'users#quote_confirm'
  match 'dashboard'         => 'users#dashboard'
  match 'admin'             => 'admin#index'
  match 'admin/add_desgins'             => 'admin#add_desgins'
  match 'admin/add_pictures'             => 'admin#add_pictures'
  match 'admin/events'             => 'admin#events'
  match 'admin/categories'             => 'admin#categories'


  match 'populate_company'             => 'site#populate_company'
  
 
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  resources :users do
    member do
      get :contacts
      post :contacts
      get :my_quotes
    end
  
    collection do
      get :facebook_login
      get :contact_by_group
      get :edit_contact
      post :destroy_contact
      post :destroy_contact_group
      post :notification_settings
      post :change_guest_name
      post :create_message
      post :confirm_quote
      
    end
  end

  resources :events do
    member do
      get :new_step_2
      get :new_step_3
      get :new_step_4
      post :invite_guests
      get :invite_guests
      get :guest_list
      get :message
      get :media
      get :customize
      post :guest_response
      get :country_changed
      get :render_guests
      get :update_response
      post :launch
      get :launch
      get :unsubscribe
      get :thumb_photos
      get :photos
      get :guest_bringing_people
    end
    
    collection do
      get :category_changed
      post :upload_fg_image
      post :upload_bg_image
      post :import_contacts
      post :upload_photo
      post :upload_video      
    end
  end

  resources :guests do
    collection do
      get :guest_bringing_people
    end
  end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "site#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
