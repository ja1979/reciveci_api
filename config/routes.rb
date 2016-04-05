Rails.application.routes.draw do



  devise_for :users
  resources :examples

  resources :rates
  resources :articles
  get 'articles_last' => 'articles#last'
  get 'articles_count' => 'articles#count'


  get 'rates_last' => 'rates#last'

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
