Rails.application.routes.draw do 

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


    resources :affiliations

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
    
    #resources :articles, :defaults => { :format => :json }

    get 'map/routes'

    get 'separate' => 'separate#complete'   

  end
end
