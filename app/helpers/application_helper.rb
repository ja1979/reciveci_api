module ApplicationHelper

	def generate_activation_code(size = 6)
  	charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  	(0...size).map{ charset.to_a[rand(charset.size)] }.join
	end

	def avatar_url(article)
	#time=@article.created_at.to_s(:time)  	
    fecha_id = Digest::MD5::hexdigest(generate_activation_code).downcase
    id=@article.id
    extension=@article.extension
    "/assets/images/articles/#{id}.#{extension}?#{fecha_id}"
  end

  def profile_url(article)
  #time=@article.created_at.to_s(:time)   
    fecha_id = Digest::MD5::hexdigest(generate_activation_code).downcase
    id=@affiliation.id
    extension=@affiliation.extension
    "/assets/images/affiliations/#{id}.#{extension}?#{fecha_id}"
  end




end
