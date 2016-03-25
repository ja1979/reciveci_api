class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!, :except => [:categories, :articles, :examples, :line_strings, :rates, :recycling_way_images, :recycling_ways, :routes, :subcategories, :waste_pickers]
  before_filter :authenticate_user!, :except => [:index, :show]
end
