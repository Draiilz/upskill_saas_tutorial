Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  # This creates custom URL and displays it to application.html.erb as new_contact_path 
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
