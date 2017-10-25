Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :articles
root "home#index"
# error pages
get "/404", :to => "errors#not_found"
get "/422", :to => "errors#unacceptable"
get "/500", :to => "errors#internal_error"


end
