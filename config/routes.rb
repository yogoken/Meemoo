Rails.application.routes.draw do
  namespace :api, default: {format: :json} do
    resources :memos, only: [:index, :create]
  end
end
