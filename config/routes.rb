Rails.application.routes.draw do




  resources :cities

  scope "(:locale)", locale:  /es|en/ do

    #establecemos el controlador registrations personalizado para usarlo en Devise
    devise_for :users, :controllers => {:registrations => "registrations"}
    devise_scope :user do
        get '/login' => 'devise/sessions#new'
        get '/logout' => 'devise/sessions#destroy'
    end

    resources :user, :controller => "user"
    get 'dashboard' => "dashboard#index"
    get 'user' => "user#index"

    resources :examples

    resources :rates
    get 'rates_last' => 'rates#last'

    resources :articles
    get 'articles_last' => 'articles#last'
    get 'articles_count' => 'articles#count'



     resources :businesses
    get 'map/business'


    resources:cities
    get 'api/v1/cities'=>'cities#affXcity'
    resources :affiliations
    get 'api/v1/affiliations' => 'affiliations#last'
    get 'map/affiliations'

    resources :line_strings

    resources :routes

    resources :recycling_way_images
    #get 'images_by_recycling_way/:recycling_way_id' => 'recycling_way_images#by_recycling_way'

    resources :recycling_ways
    get 'recycling_ways_by_subcategory/:subcategory_id' => 'recycling_ways#by_subcategory'

    resources :subcategories
    get 'subcategories_by_category/:category_id' => 'subcategories#by_category'

    resources :categories
    get 'categories_by_column/:column' => 'categories#by_column'

    resources :waste_pickers
    resources :news

    #resources :articles, :defaults => { :format => :json }

    get 'map/routes'
    
    get 'separate' => 'separate#complete'

    #creacion de rutas para el uso del API  de articles
    namespace :api, defaults:{ format: :json } do
      namespace :v1 do
        #resources :api_articles, :only => [:show, :create, :update, :destroy, :index]
        get     "/articles",     to: "api_articles#index"
        post    "/articles",     to: "api_articles#create"
        get     "/articles/:id", to: "api_articles#show"
        put     "/articles/:id", to: "api_articles#update"
        delete  "/articles/:id", to: "api_articles#destroy"
      end
    end

    #panel donde se encontrara el menu de navegacion para acceder a todas las pantallas de administracion
     get '/admin' => 'panel#index'
  end

end
