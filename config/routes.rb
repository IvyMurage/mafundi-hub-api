Rails.application.routes.draw do
  resources :tasks
  resources :handymen
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

  resources :tasks do
    get "search", on: :collection, as: "search_task"
    post "create", on: :collection, as: "create_task"
    get "show", on: :member, as: "show_task"
    patch "update", on: :member, as: "update_task"
    delete "destroy", on: :member, as: "destroy_task"
  end
  resources :service_categories do
    get "search", on: :collection, as: "search_services"
    post "create", on: :collection, as: "create_service_category"
    get "show", on: :member, as: "show_service_category"
    patch "update", on: :member, as: "update_service_category"
    delete "destroy", on: :member, as: "destroy_service_category"
  end

  resources :services do
    get "search", on: :collection, as: "search_services"
    post "create", on: :collection, as: "create_service"
    get "show", on: :member, as: "show_service"
    patch "update", on: :member, as: "update_service"
    delete "destroy", on: :member, as: "destroy_service"
  end

  resources :clients do
    get "search", on: :collection, as: "search_client"
    post "create", on: :collection, as: "create_client"
    get "show", on: :member, as: "show_client"
    patch "update", on: :member, as: "update_client"
    delete "destroy", on: :member, as: "destroy_client"
  end

  resources :locations do
    post "create", on: :collection, as: "create_location"
    get "show", on: :member, as: "show_location"
  end

  post "upload_avatar", to: "avatar_uploads#upload"
  patch "update_avatar", to: "avatar_uploads#update"
  patch "user_role", to: "user_roles#add_user_role"

  get "up" => "rails/health#show", as: :rails_health_check
end
