class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_if_user_access, only: [:create, :update, :destroy, :edit, :new]

  # GET /blogs
  # GET /blogs.json
  def index
    if params[:content_type] == "news"
      if I18n.locale == :ru
        @blogs = Blog.where(content_type: "news", language: "RU").paginate(page: params[:page])
      else
        @blogs = Blog.where(content_type: "news", language: "EN").paginate(page: params[:page])
      end
    elsif params[:content_type] == "saas"
      if I18n.locale == :ru
        @blogs = Blog.where(content_type: "saas", language: "RU").paginate(page: params[:page])
      else
        @blogs = Blog.where(content_type: "saas", language: "EN").paginate(page: params[:page])
      end
    elsif params[:content_type] == "specials"
      if I18n.locale == :ru
        @blogs = Blog.where(content_type: "specials", language: "RU").paginate(page: params[:page])
      else
        @blogs = Blog.where(content_type: "specials", language: "EN").paginate(page: params[:page])
      end
    elsif params[:content_type] == ""
      if I18n.locale == :ru
        @blogs = Blog.where(language: "RU").paginate(page: params[:page])
      else
        @blogs = Blog.where(language: "EN").paginate(page: params[:page])
      end
    else
      if I18n.locale == :ru
        @blogs = Blog.where(language: "RU").paginate(page: params[:page])
      else
        @blogs = Blog.where(language: "EN").paginate(page: params[:page])
      end
    end
    respond_to do |format|
      format.html
      format.mobile { render mobile: @blogs }
      # format json for android app
      format.json { render json: @blogs }
      format.xml { render xml: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  def check_if_user_access
    if current_user && current_user.admin?
    else
      redirect_to root_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content, :language, :content_type, :picture)
    end
end
