class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, :notice => "Post Save Sucessfully"
    else
      redirect_to "new"
    end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
   @post = Post.find(params[:id])
   if @post.update_attributes(post_params)
    redirect_to posts_path, :notice => "Post Update Successfully"
  else
    redirect_to "edit"
  end
end

def destroy
  @post = Post.find(params[:id])
  if @post.destroy
    redirect_to posts_path, :notice => "Deleted Successfully"
  end
end

private

def post_params
  params.require(:post).permit(:title, :content)
end

end
