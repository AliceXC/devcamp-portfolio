class BlogsController < ApplicationController
  # the private blog instance variables would be available to those methods.
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], 
         user: {except: [:destroy, :new, :create, :update, :edit]}, 
         site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
    @page_title = "My Portfolio Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # here we have the access to the @blog instance 
    # because we call the set_blog method at before_action
    @page_title = @blog.title
    @seo_keywords = @blog.body
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
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    # byebug is a gem for debugging
    # it stops the system, and ask system about itself
    # byebug

    if @blog.draft?
      @blog.published! 
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to blogs_url, notice: 'Post status has been updated!'
  end

  # blog instance variable
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      # by adding "friendly", it is overriding the default behavier 
      # before, looking into params for the specific id
      # now friendly does work for us, it is stilling for id, 
      # but will also check into slugs, and map to the id, then perform search
      # then return blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

end
