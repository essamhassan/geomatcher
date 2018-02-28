Rails.application.routes.draw do
  get 'get_nearby', to: 'customers#get_matching'
end
