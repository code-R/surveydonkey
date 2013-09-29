SurveyDonkey::Application.routes.draw do
  resources :surveys do
    resources :questions, only: %w(new create edit update)

    member do
      get :participate
    end
  end

  resources :questions, only: %w(destroy)

  devise_for :users
  root :to => 'surveys#index'
end