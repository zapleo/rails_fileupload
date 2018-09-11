Rails.application.routes.draw do
  resource :posts, only: [:new, :create]
  root to: "posts#new"
end
