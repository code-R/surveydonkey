SurveyDonkey::Application.routes.draw do
  resources :surveys do
    resources :questions, only: %w(new create)
  end

  devise_for :users
  root :to => 'surveys#index'
end