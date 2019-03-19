Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'location/:loc', to: 'application#location'
  get 'weather', to: 'application#weather'
end
