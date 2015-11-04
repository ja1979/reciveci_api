class AddRecyclingHowData < ActiveRecord::Migration
  def up
    cat= Category.new(:name => "Papel",:description => "Papel")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Papel Mixto",:description => "Revistas, bond, blanco")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Papel Mixto",:description => "No ensuciar el papel, apilarlo de manera que no se moje ni contamine")
        way.save
      
      subcat = Subcategory.new(:category => cat, :name => "Cartón Craft",:description => "Cartón común (ej. cajas de huevos)")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Cartón",:description => "No ensuciar el cartón, compactar las cajas y almacenarlo de manera que no se moje ni contamine")
        way.save
    
  cat= Category.new(:name => "Plásticos",:description => "Plásticos")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Plásticos LDPE",:description => "Fundas y plásticos de envolturas de color, blancas, transparentes. Plástico blando")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Plásticos LDPE",:description => "Entregar en lo posible limpio y compactado ")
        way.save
      
      subcat = Subcategory.new(:category => cat, :name => "Plásticos PET",:description => "Plástico de botellas de agua y gaseosas PET")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Plásticos PET",:description => "Entregar en lo posible limpio y compactado")
        way.save
  
    subcat = Subcategory.new(:category => cat, :name => "Plástico duro HDPE",:description => "Plástico duro HDPE Ejemplo: envases de yogurt, detergente")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Plástico HDPE",:description => "Entregar en lo posible limpio y compactado")
        way.save
    
    subcat = Subcategory.new(:category => cat, :name => "Plástico PVC",:description => "Plástico PVC Ejemplo: gavetas, baldes. Plástico rígido")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Plástico PVC",:description => "Entregar en lo posible limpio y compactado")
        way.save
    
  cat= Category.new(:name => "Chatarra",:description => "Chatarra")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Chatarra",:description => "Chatarra")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Chatarra",:description => "Insertar la tapa de los enlatados dentro del enlatado para evitar cortes")
        way.save
    
  cat= Category.new(:name => "Vidrio",:description => "Vidrio")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Vidrio",:description => "Envases de vidrio")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Reciclar Vidrio",:description => "Manipular con cuidado para evitar que se rompa y así evitar cortes")
        way.save
    
  
  end
  
  def down
    RecyclingWay.all.each{
      |x| x.delete
    }
    Subcategory.all.each{
      |x| x.delete
    }
    Category.all.each{
      |x| x.delete
    }
  end
  
end
