Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/command_center', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope '/admin' do
    resources :users
  end

  get '/member', to: 'dashboard#member', as: 'member_dashboard'
  get '/admin', to: 'dashboard#admin', as: 'admin_dashboard'

  #get '/', to: 'users/sessions#new', as: 'root'
  root to: 'dashboard#index'
  get '/logout', to: 'dashboard#logout', as: 'logout_dashboard' 
end
