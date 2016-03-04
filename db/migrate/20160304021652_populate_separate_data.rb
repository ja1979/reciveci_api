class PopulateSeparateData < ActiveRecord::Migration
  def up

    #delete old data

    Subcategory.all.each{
      |x| x.delete
    }
    Category.all.each{
      |x| x.delete
    }

    # new data

    # Papel y Cartón
    cat= Category.new(:name => "Papel y Cartón",:description => "Papel y Cartón", :image_name => "papel.png", :column => 1, :waste_type => "REC")
    cat.save

      subcat = Subcategory.new(:category => cat, :name => "Papel",:description => "Papel", :image_name => "papel.png", :examples => "- Papel Bond
- Revistas, periódicos
- Cuadernos, libros", :instructions => "Tiene que estar limpio y seco")
      subcat.save

      subcat = Subcategory.new(:category => cat, :name => "Cartón",:description => "Cartón", :image_name => "carton.png", :examples => "- Carpetas
- Cajas de huevos
- Cajas de cereales
- Cajas de te e infusiones
- Cajas de productos", :instructions => "Tiene que estar limpio y seco")
      subcat.save



    #Plásticos

    cat= Category.new(:name => "Plásticos",:description => "Plásticos", :image_name => "plastico.png", :column => 2, :waste_type => "REC")
    cat.save

      subcat = Subcategory.new(:category => cat, :name => "Envases plásticos",:description => "Envases plásticos", :image_name => "plastico_envase.png", :examples => "- Shampoo / aseo personal
- Botellas de bebidas
- Vajilla plástica
- Envases de detergente
- Envases de yogurt", :instructions => "Tienen que estar enjuagado")
      subcat.save

      subcat = Subcategory.new(:category => cat, :name => "Fundas plásticas",:description => "Fundas plásticas", :image_name => "plastico_funda.png", :examples => "- Fundas de supermercado
- Fundas del pan
- Fundas de basura", :instructions => "Tiene que estar limpio")
      subcat.save



  #chatarra
  cat= Category.new(:name => "Chatarra",:description => "Chatarra", :image_name => "chatarra.png", :column => 2, :waste_type => "REC")
  cat.save

    subcat = Subcategory.new(:category => cat, :name => "Envases de metal",:description => "Envases de metal", :image_name => "chatarra.png", :examples => "- Enlatados de bebidas
- Latas de atún
- Conservas
- Aerosoles", :instructions => "Debe estar enjuagado")
    subcat.save



  #vidrio
  cat= Category.new(:name => "Vidrio",:description => "Vidrio", :image_name => "vidrio.png", :column => 1, :waste_type => "REC")
  cat.save

    subcat = Subcategory.new(:category => cat, :name => "Envases de vidrio",:description => "Envases de vidrio", :image_name => "vidrio_envase.png", :examples => "- Envases de mermelada
- Envases de bebidas
- Envases de salsas", :instructions => "Tiene que estar enjuagado. No debe estar roto o quebrado")
    subcat.save


  #tetrapack
  cat= Category.new(:name => "Tetrapak ",:description => "Tetrapak ", :image_name => "tetrapack.png", :column => 1, :waste_type => "REC")
  cat.save

    subcat = Subcategory.new(:category => cat, :name => "Envases de tetrapack",:description => "Envases de tetrapack", :image_name => "tetrapack.png", :examples => "- Envases de leche
- Envases de avena
- Envases de jugo", :instructions => "Debe estar enjuagado")
    subcat.save


  # Ordinarios

  cat= Category.new(:name => "Ordinarios",:description => "Ordinarios", :image_name => "ordinarios.png", :column => 1, :waste_type => "NRE")
  cat.save

    subcat = Subcategory.new(:category => cat, :name => "Papel higiénico",:description => "Papel higiénico", :image_name => "papel_higienico.png", :examples => "", :instructions => "No reciclable")
    subcat.save

    subcat = Subcategory.new(:category => cat, :name => "Toallas higiénicas y pañales",:description => "Toallas higiénicas y pañales", :image_name => "panial.png", :examples => "", :instructions => "No reciclable")
    subcat.save

    subcat = Subcategory.new(:category => cat, :name => "Espuma flex / estereofón",:description => "Espuma flex / estereofón", :image_name => "espuma_flex.png", :examples => "", :instructions => "No reciclable")
    subcat.save

    subcat = Subcategory.new(:category => cat, :name => "Residuos de cocina",:description => "Residuos de cocina", :image_name => "manzana.png", :examples => "", :instructions => "No reciclable")
    subcat.save



  end

  def down
    Subcategory.all.each{
      |x| x.delete
    }
    Category.all.each{
      |x| x.delete
    }
  end

end
