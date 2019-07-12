Rails.application.routes.draw do


  get '/' => 'home#top'
  get '/about' => 'home#about'


  devise_for :admins, contorollers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :categories
    resources :lessons
    resources :ranks
    resources :users, only: [:index, :show, :destroy]
  end


  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  	resources :attends, only: [:create, :index]
  	resources :users, only: [:show, :edit, :update]
  	resources :lessons, only: [:index, :show] do
  	  member do
  	  	get 'slide'
  	  end
  	  collection do
  	    get 'search'
  	  end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
