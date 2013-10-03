SurveyDonkey::Application.routes.draw do
  resources :surveys do
    resources :questions, only: %w(new create edit update)
    resources :responses, only: %w(index)

    member do
      get :participate
    end
  end

  resources :questions, only: %w(destroy show) do
    resources :responses, only: %w(new create)
  end

  devise_for :users
  root :to => 'surveys#index'
end