Rails.application.routes.draw do


  root to: 'home#top'
  get '/about' => 'home#about', as: 'about'


  namespace :admins do
    root to: 'home#top'
    resources :categories, except: [:new, :edit]
    resources :lessons, except: [:destroy] do
      get 'slide', on: :member
    end
    resources :ranks, except: [:new, :edit]
    resources :users, only: [:index, :show, :destroy]
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }


  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  	resources :attends, only: [:create]
    resources :categories, only: [:index, :show]
  	resources :lessons, only: [:show] do
      get 'slide', on: :member
      get 'search', on: :collection
    end
    resources :users, only: [:show, :edit, :update] do
      get 'history', on: :member
      post 'target_time', on: :member
      post 'change_category', on: :member
      get 'top', on: :collection
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
