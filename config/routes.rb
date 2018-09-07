Rails.application.routes.draw do
    resources :todos, defaults: {format: :json}
    resources :users, defaults: {format: :json}
end
