MongoMetrics::Engine.routes.draw do
  root "metrics#index"
  resources :metrics, only: [:index, :destroy]
end
