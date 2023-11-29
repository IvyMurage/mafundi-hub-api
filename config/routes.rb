Rails.application.routes.draw do
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
