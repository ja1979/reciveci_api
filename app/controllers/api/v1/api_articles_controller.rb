class Api::V1::ApiArticlesController < ApplicationController
	before_action :set_article, only: [:show, :update, :destroy]
	respond_to :json
	skip_before_filter :verify_authenticity_token


	def index     
    respond_with Article.all
  end


	def show
  	respond_to do |format|
      format.json { render json: @article, methods: [:image_url] }
    end
	end

  def create
   article=Article.new(article_params) 
    # if the article is saved successfully than respond with json data and status code 201
    if article.save 
    render json: article, status: 201
   else
    render json: { errors: article.errors}, status: 422
   end
  end

	def update
    if @article.update(article_params)
      render json: @article, status: 200
    else
      render json: { errors: @article.errors }, status: 422
    end
  end

  def destroy
    @article.destroy
    head 204
  end

  protected
	  def article_params
	    params.require(:article).permit(:title, :content, :extension, :image)
	  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
end