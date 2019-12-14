Rails.application.routes.draw do
  root "static_pages#home"
  namespace :admin do
    root "admin#index"
  end
end
