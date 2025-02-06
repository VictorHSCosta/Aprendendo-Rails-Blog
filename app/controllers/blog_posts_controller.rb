class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  before_action :set_blog_post , only: [ :show, :edit, :update, :destroy]


  def authenticate_user
    if !user_signed_in?
      redirect_to root_path, alert: "You need to sign in or sign up before continuing."
    end
  end
  def index
    @blog_posts = BlogPost.all
  end

  def show
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new()
  end

  def create 
    @blog_post =  BlogPost.new(blog_post_params)  
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post 
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.delete()
    redirect_to root_path
  end


  def blog_post_params
    params.require(:blog_post).permit(:tittle, :body)
  end


  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end