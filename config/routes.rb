Rails.application.routes.draw do
  scope "/admin" do
    resources :users

    resources :courses, only: [:index]

    resources :enrollments, only: [:new, :create, :destroy]

    resources :students
  end

  devise_for :users

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
