Rails.application.routes.draw do

  root 'crypt#home'
  post '/', to: 'crypt#process_text'

end
