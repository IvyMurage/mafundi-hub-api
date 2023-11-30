Rails.application.routes.draw do
  resources :locations
  resources :clients
  resources :services

  resources :service_categories do
    get "search", on: :collection, as: "search_services"
    post "create", on: :collection, as: "create_service"
    get "show", on: :collection, as: "show_service"
    patch "update", on: :member, as: "update_service"
    delete "destroy", on: :collection, as: "destroy_service"
  end

  post "upload_avatar", to: "avatar_uploads#upload"
  devise_for :users,
             path: "",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               registration: "signup",
             },
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }

  get "up" => "rails/health#show", as: :rails_health_check
end
