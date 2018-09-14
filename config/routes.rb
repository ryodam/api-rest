Rails.application.routes.draw do
    resources :todos, defaults: {format: :json}
    resources :users, defaults: {format: :json}
    resources :department, defaults: {format: :json}
    resources :city, defaults: {format: :json}
end
