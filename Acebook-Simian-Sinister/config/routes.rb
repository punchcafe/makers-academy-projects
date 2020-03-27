# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :posts, :profilepictures

  resources :users do
    resource :profile_picture, only: [:edit,:update,:destroy]
  end


end
