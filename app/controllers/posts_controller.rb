class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Successfully created post'
    else
      flash[:danger] = @post.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(Post::FILE_FIELDS)
  end
end
