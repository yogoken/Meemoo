Rails.application.routes.draw do
  scope defaults: { format: :json } do
    namespace :api do
      namespace :v1 do
        resources :memos, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
