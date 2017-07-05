Rails.application.routes.draw do

  root 'application#hello'
  get '/secret_program', to: 'application#hello'

end
