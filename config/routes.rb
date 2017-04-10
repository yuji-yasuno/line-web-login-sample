Rails.application.routes.draw do
  root to: 'line#index'
  get 'line/index'
  get 'line/loggedin'
end
