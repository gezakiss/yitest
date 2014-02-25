EmailScrapperYieldifyCom::Application.routes.draw do

  get "checkout" => "orders#new"
  get "orders" => "orders#new"
  post "orders" => "orders#create"
  get "orders/complete" => "orders#complete"

  root "orders#new"

  namespace :api, :defaults => { :format => :json} do
    namespace :v1 do
      post "emails" => "emails#create"
    end
  end
end
