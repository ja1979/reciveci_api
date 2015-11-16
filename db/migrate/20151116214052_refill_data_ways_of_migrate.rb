class RefillDataWaysOfMigrate < ActiveRecord::Migration
  def up
    
    #delete old data
    
    RecyclingWay.all.each{
      |x| x.delete
    }
    Subcategory.all.each{
      |x| x.delete
    }
    Category.all.each{
      |x| x.delete
    }
    
    # new data
    
    # Papel y Cartón
    cat= Category.new(:name => "Papel y Cartón",:description => "Papel y Cartón", :image_name => "papel.png")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Papel Mixto",:description => "Revistas, papel blanco, papel bond, papel ecológico, papel periódico. NO papel servilleta ni higiénico")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "No ensuciar",:description => "No ensuciar el papel con líquidos y/o comida.", :image_name => "papel_limpio.png")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Apilar",:description => "Apilar y almacenar en lugar seco y limpio.", :image_name => "papel_apilado.png")
        way.save
      
      subcat = Subcategory.new(:category => cat, :name => "Cartón Craft",:description => "Cajas y gavetas de huevos, cualquier caja de cartón común, tubos de cartón craft de papel higiénico, de toallas de cocina, de papel aluminio, de cintas adhesivas, y otros.")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "No ensuciar", :description => "No ensuciar el cartón con líquidos y/o comida", :image_name => "carton_limpio.png")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Compactar", :description => "Compactar")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Apilar", :description => "Apilar y almacenar")
        way.save
  
  #Plásticos
    
  cat= Category.new(:name => "Plásticos",:description => "Plásticos", :image_name => "plastico.png")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Plástico LDPE",:description => "Plástico flexible por baja densidad de polietileno: Fundas plásticas de cualquier color, sacos de hilo plástico, objetos de menaje como vasos y otros, mangueras, plástico para uso agrícola, manteles de cocina de plástico, film estirable, botellas que no sean PET ni de plástico duro, film estirable (uso cocina), etiquetas y tapas de botellas PET, tapas de botellas de plástico rígido, recipientes de frutas y vegetales")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Doblar",:description => "Doblar en caso de materiales flexibles", :image_name => "plastico_ldpe.png")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Almacenar",:description => "Almacenar")
        way.save
      
      subcat = Subcategory.new(:category => cat, :name => "Plásticos PET",:description => "Botellas de agua y gaseosa")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Vaciar",:description => "Vaciar el contenido líquido")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Compactar",:description => "Compactar y almacenar", :image_name => "plastico_pet.png")
        way.save
  
    subcat = Subcategory.new(:category => cat, :name => "Plástico HDPE (duro)",:description => "Envases de yogurt, detergente y línea de limpieza, shampo y acondicionador, enjuage bucal, frascos de vitaminas y medicamentos, envases de cera para pisos.")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Vaciar",:description => "Vaciar el contenido líquido")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Enjuagar",:description => "Enjuagar internamente")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Almacenar",:description => "Almacenar", :image_name => "plastico_hdpe.png")
        way.save
    
    subcat = Subcategory.new(:category => cat, :name => "Plástico PVC (rígido o flexible)",:description => "tubos, gavetas, baldes, ropa,canastas, sillas, otros.")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Almacenar",:description => "Almacenar", :image_name => "plastico_pvc.png")
        way.save
  
  
  #chatarra  
  cat= Category.new(:name => "Chatarra",:description => "Chatarra", :image_name => "chatarra.png")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Chatarra",:description => "Latas de bebidas, envases de desodorantes, envases de ambientadores, envases de insecticidas, objetos metálicos. NO pilas, pintura, basura orgánica, desechos hospitalarios, madera")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Manipular",:description => "Manipular con cuidado")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Enjuagar",:description => "Enjuagar internamente")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Insertar",:description => "Insertar la tapa de las latas dentro del enlatado para evitar cortes", :image_name => "chatarra_tapa.png")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Compactar",:description => "De ser posible compactar", :image_name => "chatarra_compactar.png")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Almacenar",:description => "Almacenar")
        way.save
  
  
  #vidrio  
  cat= Category.new(:name => "Vidrio",:description => "Vidrio", :image_name => "vidrio.png")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Envases de vidrio",:description => "Envases de vidrio (ningún tipo de foco o lámpara de iluminación tipo iridiscente)")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Vaciar",:description => "Vaciar el contenido")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Manipular",:description => "Manipular con cuidado durante el almacenaje como en la entrega", :image_name => "vidrio.png")
        way.save
  
  #tetrapack
  cat= Category.new(:name => "Tetrapak ",:description => "Tetrapak ", :image_name => "tetrapack.png")
    cat.save
    
      subcat = Subcategory.new(:category => cat, :name => "Envases de tetrapack",:description => "Envases de tetrapak de jugos, leches, avena, yogurt, etc.")
      subcat.save
      
        way=RecyclingWay.new(:subcategory => subcat, :title => "Vaciar",:description => "Vaciar el contenido")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Compactar",:description => "Compactar")
        way.save
        
        way=RecyclingWay.new(:subcategory => subcat, :title => "Apilar",:description => "Apilar los envases en un lugar seco y limpio ", :image_name => "tetrapack.png")
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
