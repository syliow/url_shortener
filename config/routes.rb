Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root path
  root "urls#new"

  # Resources for URLs
  resources :urls, only: [:new, :create, :show]

  # Custom redirect for shortened URLs
  get "/:short_url", to: "urls#redirect", as: :shortened

  # Resources for reports
  resources :reports, only: [:index]
end
