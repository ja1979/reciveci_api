class Example < ActiveRecord::Base
  belongs_to :subcategory
  # validates :name, :presence => true
end
