Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#home'
  get 'users/new'
  post 'users/personnel_create'
	# log in page with form:
	get '/login'     => 'sessions#new'
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'  
  get '/logout' => 'sessions#destroy'

  
  get 'users/index'
  get 'users/edit'
  post 'users/personnel_edit'
  get 'users/personnel_delete'

  get 'expense/add_expense'
  post 'expense/add_expense'

  get 'expense/create_new_expense'
  post 'expense/create_new_expense'

  get 'expense/show_expenses'
  post 'expense/show_expenses'

  get 'users/home'
  get 'expense/form_four'

  get 'users/create_group'
  post 'users/create_group_post'

  # this is to get all group information
  get 'users/group_list'
  # this is to get tag_a_bill page
  get 'expense/tag_a_bill'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
