Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :users do
    resource :profile
  end  
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  # This creates custom URL and displays it to application.html.erb as new_contact_path 
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
