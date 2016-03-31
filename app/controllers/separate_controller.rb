include Utils

class SeparateController < ApplicationController
  load_and_authorize_resource

  def getSubcategories(category_id, url_prefix)

    subcategories = Subcategory.where(category_id: category_id)
    resultSubcat = Array.new
    subcategories.each do |subcat|
      resultSubcat << {
        name: subcat.name,
        examples: subcat.examples,
        instructions: subcat.instructions,
        image_url: subcat.image_url ? url_prefix + subcat.image_url : nil
      }
    end
    resultSubcat
  end



  def getCategories(wasteType, column, url_prefix)

    categories = Category.where(waste_type: wasteType, column: column)
    resultCat = Array.new
    categories.each do |cat|
      resultSubcat = getSubcategories(cat.id, url_prefix)
      puts cat.id
      resultCat << {
        name: cat.name,
        image_url: cat.image_url ? url_prefix + cat.image_url : nil,
        subcategories: resultSubcat
      }
    end
    resultCat

  end


  def complete

    url_prefix = serverUrl(request)

    result = Array.new

    # Recyclables
    resultCatCol1 = getCategories('REC', 1, url_prefix)
    resultCatCol2 = getCategories('REC', 2, url_prefix)
    result << {
      waste_type: 'REC',
      waste_type_name: 'Reciclables',
      categories_col1: resultCatCol1,
      categories_col2: resultCatCol2
    }

    # No recyclables
    resultCatCol1 = getCategories('NRE', 1, url_prefix)
    resultCatCol2 = getCategories('NRE', 2, url_prefix)
    result << {
      waste_type: 'NRE',
      waste_type_name: 'No reciclables',
      categories_col1: resultCatCol1,
      categories_col2: resultCatCol2
    }



    respond_to do |format|
      format.json { render json: result }
    end
  end





end
