include Utils

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_filter :cors_set_access_control_headers


  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end


  # GET /articles/last.json
  def last
    @articles = Article.order('created_at DESC').limit(10)

    #sleep(1)

    #url_prefix = request.protocol + request.host + ":" + request.port.to_s + "/"
    url_prefix = serverUrl(request)


    @result = Array.new

    @articles.each do |article|
      @result << {
        id: article.id,
        title: article.title,
        content: article.content,
        image: article.image_url ? url_prefix + article.image_url : nil,
        created_at: article.created_at
        }
    end

    respond_to do |format|
      format.json { render json: @result }
    end
  end

  # GET /articles/last.json
  def count



    if params[:date].present?
      # puts params[:date]
      date = params[:date].to_time + 1
      @count = Article.where("created_at > ?",date).order('created_at DESC').limit(10).count
    else
      @count = Article.order('created_at DESC').limit(10).count
    end

    @result = {
      count: @count,
      # date: params[:date]
    }

    respond_to do |format|
      format.json { render json: @result }
    end
  end


  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order('id DESC')
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @article, methods: [:image_url] }
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      #params[:article]
      params.require(:article).permit(:title, :content , :image, :extension)
    end
end
