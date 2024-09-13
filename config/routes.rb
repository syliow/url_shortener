# config/routes.rb
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
  # GET /urls/new – The new action in the UrlsController to render a form for creating a new URL.
	# POST /urls – The create action in the UrlsController to handle form submission and create the short URL.
	# GET /urls/:id – The show action in the UrlsController to display the details of a specific shortened URL.
  resources :urls, only: [ :new, :create, :show ]

  # Custom redirect for shortened URLs
  # Why custom? This is specifically for redirecting shortened URLs.
  get "/:short_url", to: "urls#redirect", as: :shortened

  # Resources for reports with custom API routes
  resources :reports, only: [ :index ] do
    collection do
      get :api_index
      get :api_all_urls
    end
  end
end

# get :api_index - This creates a route that maps to the api_index action in the ReportsController. The resulting route is GET /reports/api_index.
# get :api_all_urls - This creates a route that maps to the api_all_urls action in the ReportsController. The resulting route is GET /reports/api_all_urls.

