class FirstRatesEntry < ActiveRecord::Migration
  def up
    rate = Rate.new(:title => "Reciclaje Inclusivo", :description => "Considerando la actual demanda de materiales de cartón y papel a nivel nacional, así como también la oferta latente por parte de los miles de recicladores de base, se torna fundamental el desarrollo de alianzas estratégicas de forma directa y formal entre la industria de reciclaje y recicladores de base.", :image_name => "base.png")
    rate.save
    
    rate = Rate.new(:title => "Clasificación", :description => "En el Ecuador se genera al rededor de 11.341 toneladas diarias de residuos sólidos, es decir un aproximado de 4’139.512 toneladas/año, de los cuales el 61,4% son orgánicos, papel/cartón 9,4%, plástico 11%, vidrio 2,6%, chatarra 2,2%, y otros 13,3%", :image_name => "clasificacion.png")
    rate.save
  end
  
  def down
    Rate.all.each{
      |x| x.delete
    }
  end
end
