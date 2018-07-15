class BlogsController < ApplicationController
  before_action :find_blog, only: [:edit, :update, :show, :delete]

  def index
    @blog = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new
    if @blog.save(blog_params)
      flash[:notice] = "Successfully created Blog!"
      redirect_to blog_path(@blog)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to blog_path(@blog)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      flash[:notice] = "Successfully Deleted"
      redirect_to blog_path
    else
      flash[:alert] = "Error updating blog"
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :author)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
end
