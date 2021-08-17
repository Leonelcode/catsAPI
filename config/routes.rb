Rails.application.routes.draw do
  resources :cats, :defaults => { :format => :json }
  resources :breeds, only: :index
end
