Rails.application.routes.draw do

  resources :waste_pickers

  resources :articles
  #resources :articles, :defaults => { :format => :json }

  get 'articles_last' => 'articles#last'



end
