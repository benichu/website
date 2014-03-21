Railsbridge::Application.routes.draw do

  resources :checks

  resources :registrants
  # Quick fix for 404 from tweet
  get '/register', to: redirect('/registration')

  post "/mailer"  , to: 'messages#create' , as: :mailer

  # More information on localized routes here: https://github.com/enriclluelles/route_translator
  # Actual paths in locale files, i.e. config/locales/(en|fr).yml
  localized do
    get "/team"     , to: 'pages#team'
    get '/register' , to: 'registrants#new'
    get "/sponsors" , to: 'pages#sponsors'

    root 'pages#home'
  end

end
